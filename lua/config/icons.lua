local ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not ok then
    return
end

nvim_web_devicons.setup({
    override = {
        ["gnumakefile"] = {
            icon = "",
            color = "#FFFFFF",
            name = "Makefile",
        },
        ["makefile"] = {
            icon = "",
            color = "#FFFFFF",
            name = "Makefile",
        },
        ["mk"] = {
            icon = "",
            color = "#FFFFFF",
            name = "Makefile",
        },
        [".gitignore"] = {
            icon = "",
            color = "#f54d27",
            name = "GitIgnore",
        },
        [".gitattributes"] = {
            icon = "",
            color = "#f54d27",
            name = "GitAttributes",
        },
    },
})
