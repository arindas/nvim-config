local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.completion.spell,
	null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.gofmt,
	null_ls.builtins.formatting.goimports,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.clang_format,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		-- code
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
	    augroup LspFormatting
	        autocmd! * <buffer>
		autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
	    augroup END
	    ]])
		end
	end,
})
