local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,
    -- null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.fourmolu,
}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
end

local function on_attach(client, bufnr)
    lsp_keymaps(bufnr)

    -- code
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
	    augroup LspFormatting
	        autocmd! * <buffer>
		autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
	    augroup END
	    ]])
    end
end

null_ls.setup({
    sources = sources,
    on_attach = on_attach,
})
