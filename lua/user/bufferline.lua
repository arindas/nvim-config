local status_ok, bufferline_module = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline_module.setup{}
