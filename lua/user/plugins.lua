local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- essential plugins
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("mfussenegger/nvim-dap")

    -- optimisation
    use("lewis6991/impatient.nvim")
    -- use("nathom/filetype.nvim")

    -- colorscheme
    use("RRethy/nvim-base16")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })

    use({ "nvim-tree/nvim-web-devicons" })
    use({ "akinsho/bufferline.nvim", branch = "main", requires = "nvim-tree/nvim-web-devicons" })
    use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup()
        end,
    })

    use({ "williamboman/mason.nvim" })

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use({ "williamboman/mason-lspconfig.nvim", requires = { "williamboman/mason.nvim" } })

    use({ "arindas/symbols-outline.nvim" })

    use({
        "arindas/rust-tools.nvim",
    })

    use({
        "ziglang/zig.vim",
        ft = { "zig" },
    })

    use("jose-elias-alvarez/null-ls.nvim")

    -- DAP
    use({ "jay-babu/mason-nvim-dap.nvim", requires = { "mfussenegger/nvim-dap" } })
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use({ "leoluz/nvim-dap-go", ft = { "go" } })

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", event = "BufEnter" })
    use({ "nvim-telescope/telescope-ui-select.nvim", requires = { "nvim-telescope/telescope.nvim", opt = true } })
    use({ "nvim-telescope/telescope-file-browser.nvim", requires = { "nvim-telescope/telescope.nvim", opt = true } })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter" })
    -- use("HiPhish/rainbow-delimiters.nvim")
    use({
        "klen/nvim-test",
        requires = { "nvim-treesitter/nvim-treesitter", opt = true },
        config = function()
            require("nvim-test").setup({
                term = "toggleterm",
                termOpts = {
                    direction = "horizontal",
                },
            })
        end,
    })

    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    use({ "akinsho/toggleterm.nvim", branch = "main" })

    use({
        "goolord/alpha-nvim",
        commit = "417e756951cb0395f080f2c0eda84c8aadcbb80e",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
    })

    use({ "dstein64/vim-startuptime" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
