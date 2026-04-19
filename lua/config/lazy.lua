-- Install lazy.nvim automatically
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.loader.enable()

local plugin_specs = {}
vim.list_extend(plugin_specs, require("plugins.core"))
vim.list_extend(plugin_specs, require("plugins.completion"))
vim.list_extend(plugin_specs, require("plugins.ui"))
vim.list_extend(plugin_specs, require("plugins.lsp"))
vim.list_extend(plugin_specs, require("plugins.dap"))
vim.list_extend(plugin_specs, require("plugins.telescope"))
vim.list_extend(plugin_specs, require("plugins.editor"))

-- Load plugins
require("lazy").setup(plugin_specs)
