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
            local filter_result = true
            local buffer = vim.bo[buf_number]

            filter_result = filter_result and buffer.filetype ~= "dap-repl"
            filter_result = filter_result and buffer.buftype ~= "terminal"
            filter_result = filter_result and buffer.filetype ~= "qf"

            return filter_result
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
