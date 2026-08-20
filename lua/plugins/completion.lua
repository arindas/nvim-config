return {
    -- Completion and snippets
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
    },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    { "L3MON4D3/LuaSnip", event = "InsertEnter" },
    { "rafamadriz/friendly-snippets", lazy = true },
}
