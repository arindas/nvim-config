local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup {}

local opts = {
    capabilities = require("user.lsp.handlers").capabilities,
    on_attach = require("user.lsp.handlers").on_attach,
}

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "jsonls", "pyright", "clangd", "gopls", "zls", "tsserver", "rust_analyzer"
    }
}

local function rust_tools_keymaps(bufnr)
    local keymap_custom_opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(
        bufnr,
        "n",
        "<leader>rc",
        "<cmd>lua pcall(require('rust-tools.open_cargo_toml').open_cargo_toml)<CR>",
        keymap_custom_opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>rr",
        "<cmd>lua pcall(require('rust-tools.runnables').runnables)<CR>",
        keymap_custom_opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>rd",
        "<cmd>lua pcall(require('rust-tools.debuggables').debuggables)<CR>",
        keymap_custom_opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>re",
        "<cmd>lua pcall(require('rust-tools.expand_macro').expand_macro)<CR>",
        keymap_custom_opts
    )
end

local function rust_tools_on_attach(client, bufnr)
    opts.on_attach(client, bufnr)
    rust_tools_keymaps(bufnr)
end

local codelldb_home = vim.env.HOME .. "/applications/codelldb/extension/"
local codelldb_path = codelldb_home .. 'adapter/codelldb'
local liblldb_path = codelldb_home .. 'lldb/lib/liblldb.so'

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(opts)
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function()
        require("rust-tools").setup {
            server = {
                on_attach = rust_tools_on_attach,
                capabilities = opts.capabilities,
            },

            dap = {
                adapter = require('rust-tools.dap').get_codelldb_adapter(
                    codelldb_path, liblldb_path)
            }
        }
    end,

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
    end
}

-- configure LspInfo window border
local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
    local lspinfoconfig = _default_opts(options)
    lspinfoconfig.border = "rounded"
    return lspinfoconfig
end
