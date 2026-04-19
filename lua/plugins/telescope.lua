return {
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
}
