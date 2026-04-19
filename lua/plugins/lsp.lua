return {
    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        version = "1.32.0",
    },

    -- Language/tooling extras
    "ziglang/zig.vim",
    "mrcjkb/rustaceanvim",
    "nvimtools/none-ls.nvim",
}
