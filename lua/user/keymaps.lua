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
keymap("n", "<S-A-h>", "<cmd>BufferLineCloseLeft<cr>", opts)
keymap("n", "<S-A-l>", "<cmd>BufferLineCloseRight<cr>", opts)

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
keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t/", "<cmd>Telescope file_browser<cr>", opts)
keymap("n", "<leader>th", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>td", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<leader>tc", "<cmd>Telescope git_commits<cr>", opts)

-- nvim-test
keymap("n", "<leader>Tn", "<cmd>TestNearest<cr>", opts)
keymap("n", "<leader>Tl", "<cmd>TestLast<cr>", opts)
keymap("n", "<leader>Tf", "<cmd>TestFile<cr>", opts)
keymap("n", "<leader>Ts", "<cmd>TestSuite<cr>", opts)

-- Open dashboard
keymap("n", "<leader>a", "<cmd>Alpha<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>:AlphaRedraw<CR>", opts)
keymap("n", "<C-e>", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<C-n>", ":NvimTreeFocus<CR>", opts)

-- SymbolsOutline
keymap("n", "<leader>s", "<cmd>Outline<CR>", opts)

-- Filters
-- execute paragraph as bash shell and paste the result in the following paragraph
keymap("n", "<leader>be", "yap}o<CR><esc>p!ipbash<CR>", opts)
