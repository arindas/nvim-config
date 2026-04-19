require("user.lsp.config")
require("user.lsp.handlers").setup()

if vim.lsp and vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
    vim.lsp.inlay_hint.enable()
end
