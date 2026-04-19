local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_handlers, handlers = pcall(require, "config.lsp.handlers")
if not status_ok_handlers then
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    return
end

mason.setup({})

local default_opts = {
    capabilities = handlers.capabilities,
    on_init = handlers.on_init,
    on_attach = handlers.on_attach,
}

local function setup_server(server_name, server_opts)
    local merged_opts = vim.tbl_deep_extend("force", default_opts, server_opts or {})

    if vim.lsp and vim.lsp.config and vim.lsp.enable then
        vim.lsp.config(server_name, merged_opts)
        vim.lsp.enable(server_name)
        return
    end

    local ok, lspconfig = pcall(require, "lspconfig")
    if ok and lspconfig[server_name] then
        lspconfig[server_name].setup(merged_opts)
    end
end

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "zls",
        "rust_analyzer",
    },
})

mason_lspconfig.setup_handlers({
    function(server_name)
        setup_server(server_name)
    end,

    ["rust_analyzer"] = function() end,

    ["jsonls"] = function()
        setup_server("jsonls", require("config.lsp.settings.jsonls"))
    end,

    ["lua_ls"] = function()
        setup_server("lua_ls", require("config.lsp.settings.lua_ls"))
    end,

    ["pyright"] = function()
        setup_server("pyright", require("config.lsp.settings.pyright"))
    end,

    ["clangd"] = function()
        setup_server("clangd", require("config.lsp.settings.clangd"))
    end,
})