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
    local cmd = merged_opts.cmd and merged_opts.cmd[1]

    if cmd and vim.fn.executable(cmd) == 0 then
        vim.schedule(function()
            vim.notify(string.format("LSP '%s' not started: executable '%s' not found", server_name, cmd), vim.log.levels.WARN)
        end)
        return
    end

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

    ["lua_ls"] = function()
        setup_server("lua_ls", require("config.lsp.settings.lua_ls"))
    end,

    ["clangd"] = function()
        setup_server("clangd", require("config.lsp.settings.clangd"))
    end,
})

setup_server("pyrefly", require("config.lsp.settings.pyrefly"))