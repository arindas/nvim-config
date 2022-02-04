-- Set colorscheme

local colorscheme = "base16-material-darker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd([[hi VertSplit guifg=#353535]])
vim.cmd([[hi NvimTreeNormal guibg=#1a1a1a]])

vim.cmd([[hi LineNr guifg=#4a4a4a]])
vim.cmd([[hi CursorLineNr guibg=bg]])

vim.cmd([[highlight! link TelescopeSelection    Visual]])
vim.cmd([[highlight! link TelescopeNormal       Normal]])
vim.cmd([[highlight! link TelescopePromptNormal TelescopeNormal]])
vim.cmd([[highlight! link TelescopeBorder       TelescopeNormal]])
vim.cmd([[highlight! link TelescopePromptBorder TelescopeBorder]])
vim.cmd([[highlight! link TelescopeTitle        TelescopeBorder]])
vim.cmd([[highlight! link TelescopePromptTitle  TelescopeTitle]])
vim.cmd([[highlight! link TelescopeResultsTitle TelescopeTitle]])
vim.cmd([[highlight! link TelescopePreviewTitle TelescopeTitle]])
vim.cmd([[highlight! link TelescopePromptPrefix Identifier]])
