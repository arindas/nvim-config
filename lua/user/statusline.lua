local status_ok, lualine_module = pcall(require, "lualine")

if not status_ok then
    return
end

local colors = {
    black = "#212121",
    white = "#ffffff",
    red = "#f07178",
    green = "#c3e88d",
    blue = "#89ddff",
    violet = "#82aaff",
    yellow = "#ffcb6b",
    gray = "#eeffff",
    darkgray = "#2c2c2c",
    lightgray = "#424242",
    inactivegray = "#2c2c2c",
}
local colorscheme = {
    normal = {
        a = { bg = colors.blue, fg = colors.black },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    insert = {
        a = { bg = colors.violet, fg = colors.black },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    visual = {
        a = { bg = colors.yellow, fg = colors.black },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    replace = {
        a = { bg = colors.red, fg = colors.black },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    command = {
        a = { bg = colors.green, fg = colors.black },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    inactive = {
        a = { bg = colors.darkgray, fg = colors.gray },
        b = { bg = colors.darkgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
}

local lualine_ignored_filetypes = {
    "NvimTree",
    "Outline",
    "dapui_scopes",
    "dapui_breakpoints",
    "dapui_stacks",
    "dapui_watches",
    "dap-repl",
    "dapui_console"
}

lualine_module.setup({
    options = {
        icons_enabled = true,
        theme = colorscheme,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        ignore_focus = lualine_ignored_filetypes,
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
