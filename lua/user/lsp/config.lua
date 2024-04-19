local status_ok, mason = pcall(require, "mason")

if not status_ok then
    return
end

mason.setup({})

local status_ok_handlers, handlers = pcall(require, "user.lsp.handlers")

if not status_ok_handlers then
    return
end

local opts = {
    capabilities = handlers.capabilities,
    on_init = handlers.on_init,
    on_attach = handlers.on_attach,
}

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "jsonls",
        "pyright",
        "clangd",
        "gopls",
        "zls",
        "tsserver",
        "rust_analyzer",
    },
})

require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(opts)
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function() end,

    ["jsonls"] = function()
        local jsonls_opts = require("user.lsp.settings.jsonls")
        jsonls_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        lspconfig.jsonls.setup(jsonls_opts)
    end,

    ["lua_ls"] = function()
        local lua_ls_opts = require("user.lsp.settings.lua_ls")
        lua_ls_opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
        lspconfig.lua_ls.setup(lua_ls_opts)
    end,

    ["pyright"] = function()
        local pyright_opts = require("user.lsp.settings.pyright")
        pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        lspconfig.pyright.setup(pyright_opts)
    end,

    ["clangd"] = function()
        local clangd_opts = require("user.lsp.settings.clangd")
        clangd_opts = vim.tbl_deep_extend("force", clangd_opts, opts)
        lspconfig.clangd.setup(clangd_opts)
    end,
})

-- configure LspInfo window border
local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
    local lspinfoconfig = _default_opts(options)
    lspinfoconfig.border = "rounded"
    return lspinfoconfig
end
