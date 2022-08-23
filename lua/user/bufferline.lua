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
	},

	highlights = {
		indicator_selected = {
			fg = "#b2ccd6",
		},
	},
})
