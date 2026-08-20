return {
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
    {
        "goolord/alpha-nvim",
        commit = "417e756951cb0395f080f2c0eda84c8aadcbb80e",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VimEnter",
    },
    "hedyhli/outline.nvim",
}
