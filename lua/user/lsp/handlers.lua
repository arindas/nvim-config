local M = {}

M.setup = function()
    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = "󰋼 ",
                [vim.diagnostic.severity.HINT] = "󰌵 ",
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.cmd([[
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]])
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "sh", "<cmd>lua vim.lsp.buf.signature_help({border = 'rounded'})<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

M.on_init = function(client, _)
    if client.server_capabilities then
        client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
    end
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)

    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
	    augroup LspFormatting
	        autocmd! * <buffer>
		    autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
	    augroup END
	    ]])
    end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
