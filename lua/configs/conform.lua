local status, conform = pcall(require, "conform")
if not status then
	return
end

conform.setup({
	notify_on_error = false,
	notify_no_formatters = false,
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		yaml = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		markdown = { "prettierd", "prettier" },
	},
})
