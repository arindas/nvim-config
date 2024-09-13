local status_ok, lsp_handlers = pcall(require, "user.lsp.handlers")

if not status_ok then
    return
end

vim.g.rustaceanvim = {
    -- LSP configuration
    tools = {
        float_win_config = {
            border = "rounded",
        },
    },
    server = {
        on_attach = function(client, bufnr)
            lsp_handlers.on_attach(client, bufnr)

            vim.keymap.set("n", "<leader>rd", function()
                vim.cmd.RustLsp("debuggables")
            end, { silent = true, buffer = bufnr })

            vim.keymap.set("n", "<leader>rr", function()
                vim.cmd.RustLsp("runnables")
            end, { silent = true, buffer = bufnr })

            vim.keymap.set("n", "<leader>rt", function()
                vim.cmd.RustLsp("testables")
            end, { silent = true, buffer = bufnr })

            vim.keymap.set("n", "<leader>rc", function()
                vim.cmd.RustLsp("openCargo")
            end, { silent = true, buffer = bufnr })

            vim.keymap.set("n", "<leader>re", function()
                vim.cmd.RustLsp("expandMacro")
            end, { silent = true, buffer = bufnr })
        end,
        load_vscode_settings = false,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {},
        },
    },
}
