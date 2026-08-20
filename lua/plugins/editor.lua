return {
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Treesitter
    -- https://stackoverflow.com/a/79889920
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            local languages = {
                "c",
                "cpp",
                "zig",
                "rust",
                "go",
                "bash",
                "lua",
                "css",
                "ocaml",
                "haskell",
                "dockerfile",
                "html",
                "javascript",
                "json",
                "markdown",
                "php",
                "python",
                "sql",
                "typescript",
                "vim",
                "vue",
                "yaml",
            }

            ts.setup({})

            -- NOTE: If languages fail to install or compilation hangs,
            -- ensure 'tree-sitter-cli' is installed (e.g., :MasonInstall tree-sitter-cli).
            -- If the issue persists, run :checkhealth nvim-treesitter to diagnose.

            -- Use :TSInstall for manuall install languages
            ts.install(languages)

            -- Treesitter features for installed languages must be enabled manually
            vim.api.nvim_create_autocmd("FileType", {
                pattern = languages,
                callback = function()
                    -- Enable native Neovim treesitter highlighting
                    vim.treesitter.start()

                    -- Configure code folding
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo.foldmethod = "expr"
                    vim.wo.foldlevel = 99

                    -- Enable treesitter-based indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },

    {
        "vim-test/vim-test",
        config = function()
            vim.g["test#strategy"] = "neovim"
            vim.g["test#neovim#term_position"] = "botright 12"
        end,
        cmd = {
            "TestNearest",
            "TestFile",
            "TestSuite",
            "TestLast",
            "TestVisit",
        },
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

    -- Startup time profiling
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
}
