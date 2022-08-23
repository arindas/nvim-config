local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
	vim.notify("symbols outline not found!")
	return
end

symbols_outline.setup({
	preview_bg_highlight = "bg",
	highlight_hovered_item = false,
	auto_preview = false,
})
