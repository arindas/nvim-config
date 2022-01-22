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
    dashboard.button("SPC f", "  Find file"),
    dashboard.button("SPC h", "  Recently opened files"),
    dashboard.button("SPC g", "  Find word"),
}

alpha.setup(dashboard.config)

