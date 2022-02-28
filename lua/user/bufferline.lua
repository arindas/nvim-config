local status_ok, bufferline_module = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline_module.setup({
	options = {

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
			guifg = "#b2ccd6",
		},
	},
})
