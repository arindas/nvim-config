local syntax_ok, rust_tools = pcall(require, "rust-tools")
if not syntax_ok then
    return
end

rust_tools.setup({})

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- enable key hints at start

keymap("n", "<leader>ri", "<cmd>lua pcall(require('rust-tools.inlay_hints').set_inlay_hints)<CR>", opts)
keymap("n", "<leader>rh", "<cmd>lua pcall(require('rust-tools.inlay_hints').toggle_inlay_hints)<CR>", opts)
keymap("n", "<leader>rr", "<cmd>lua pcall(require('rust-tools.runnables').runnables)<CR>", opts)
keymap("n", "<leader>re", "<cmd>lua pcall(require'rust-tools.expand_macro'.expand_macro)<CR>", opts)
keymap("n", "<leader>rc", "<cmd>lua pcall(require'rust-tools.open_cargo_toml'.open_cargo_toml)", opts)
