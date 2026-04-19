local syntax_ok, alpha = pcall(require, "alpha")
if not syntax_ok then
    return
end

local ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not ok then
    return
end

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<cmd>ene <CR>"),
    dashboard.button("SPC t f", "󰍉  Find file"),
    dashboard.button("SPC t /", "  Browse files"),
    dashboard.button("SPC t h", "󰈢  Recently opened files"),
    dashboard.button("SPC t g", "󰱼  Find word"),
    dashboard.button("SPC t d", "  Git Diff Preview"),
    dashboard.button("SPC t c", "  Git Commits"),
    dashboard.button("q", "󰿅  Quit", "<cmd>qa<CR>"),
}

local fortune_ok, fortune = pcall(require, "alpha.fortune")
if fortune_ok then
    dashboard.section.footer.val = fortune()
end

alpha.setup(dashboard.config)
