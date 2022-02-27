local status_ok, bufferline_module = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline_module.setup({
	options = {
		indicator_icon = " ",
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				text_align = "left",
				-- padding = 1,
			},
		},
	},
})
