vim.cmd([[autocmd TermOpen * setlocal nonumber norelativenumber ]]) -- hide line numbers in terminal mode
vim.cmd([[autocmd TermOpen * setlocal signcolumn=no ]]) -- hide signed column in terminal

vim.cmd([[autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("user.statusline").hide_statusline()]])
