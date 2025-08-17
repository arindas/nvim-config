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

-- Load plugins
require("lazy").setup({
    -- Plugin manager manages itself
    { "folke/lazy.nvim", version = "*" },

    -- Essentials
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    -- "nathom/filetype.nvim", -- optional, commented

    -- Colorscheme
    "RRethy/nvim-base16",

    -- Completion and snippets
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    {
        "hrsh7th/nvim-cmp", -- load cmp on InsertEnter
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
    },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    { "L3MON4D3/LuaSnip", event = "InsertEnter" },
    { "rafamadriz/friendly-snippets", lazy = true },

    -- UI
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "akinsho/bufferline.nvim",
        branch = "main",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "NvimTreeFocus", "NvimTreeToggle" },
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        version = "1.32.0",
    },

    -- Outline, Zig, Rust
    "hedyhli/outline.nvim",
    "ziglang/zig.vim",
    "mrcjkb/rustaceanvim",
    "nvimtools/none-ls.nvim",

    -- DAP
    "mfussenegger/nvim-dap",
    { "jay-babu/mason-nvim-dap.nvim", dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    { "leoluz/nvim-dap-go", ft = "go" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        event = "BufEnter",
        config = function()
            require("telescope").setup({
                defaults = {
                    path_display = { "smart" },
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = { prompt_position = "top" },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("file_browser")
        end,
        dependencies = {
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
        },
    },

    -- Treesitter and Testing
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "klen/nvim-test",
        config = function()
            require("nvim-test").setup({
                term = "toggleterm",
                termOpts = { direction = "horizontal" },
            })
        end,
        event = "VeryLazy",
    },

    -- Other utilities
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
        lazy = true,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
        event = "InsertEnter",
    },
    {
        "nmac427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup()
        end,
    },
    { "akinsho/toggleterm.nvim", branch = "main" },

    -- Startup screen
    {
        "goolord/alpha-nvim",
        commit = "417e756951cb0395f080f2c0eda84c8aadcbb80e",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        event = "VimEnter",
    },

    -- Startup time profiling
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
})
