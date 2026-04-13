local status, noice = pcall(require, "noice")
if not status then
	return
end

noice.setup({
	lsp = {
		progress = {
			enabled = true,
		},
		hover = {
			enabled = true,
		},
		signature = {
			enabled = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		lsp_doc_border = true,
	},
})
