-- Set colorscheme

local colorscheme = "base16-material-darker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd [[hi VertSplit guifg=#353535]]
vim.cmd [[hi NvimTreeNormal guibg=#1a1a1a]]

vim.cmd [[hi LineNr guifg=#4a4a4a]]
vim.cmd [[hi CursorLineNr guibg=bg]]
