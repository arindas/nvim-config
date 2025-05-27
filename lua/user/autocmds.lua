vim.cmd([[autocmd TermOpen * setlocal nonumber norelativenumber ]]) -- hide line numbers in terminal mode
vim.cmd([[autocmd TermOpen * setlocal signcolumn=no ]]) -- hide signed column in terminal

vim.cmd([[au BufRead,BufNewFile *.env set filetype=env syntax=sh]])

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusGained" }, {
    pattern = { "*" },
    command = [[call setreg("@", getreg("+"))]],
})

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusLost" }, {
    pattern = { "*" },
    command = [[call setreg("+", getreg("@"))]],
})
