local status_ok, bufferline_module = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline_module.setup({
    options = {
        indicator = { icon = " " },
        modified_icon = "",
        close_icon = "",
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                text_align = "left",
            },
        },
        custom_filter = function(buf_number, _)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "dap-repl" then
                return true
            end
        end,
    },
    highlights = {
        indicator_selected = {
            fg = "#b2ccd6",
        },
        buffer_selected = {
            italic = false,
        }
    },
})
