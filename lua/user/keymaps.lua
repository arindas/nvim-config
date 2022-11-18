local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Disable search highlight until next search
keymap("n", "<esc><esc>", ":noh<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>/", "<cmd>Telescope file_browser<cr>", opts)
keymap("n", "<leader>h", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

-- Open dashboard
keymap("n", "<leader>d", "<cmd>Alpha<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>:AlphaRedraw<CR>", opts)
keymap("n", "<C-e>", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<C-n>", ":NvimTreeFocus<CR>", opts)

-- SymbolsOutline
keymap("n", "<leader>s", "<cmd>SymbolsOutline<CR>", opts)

-- Filters
-- execute paragraph as bash shell and paste the result in the following paragraph
keymap("n", "<leader>be", "yap}o<CR><esc>p!ipbash<CR>", opts)

-- DAP
keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<F6>", "<Cmd>lua require'dap'.terminate()<CR>", opts)
keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
