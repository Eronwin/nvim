-- 在 LSP 附加到缓冲区时调用的函数
local on_attach = function(client, bufnr)
	local map = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr })
	end

	map("n", "gD", vim.lsp.buf.declaration)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gi", vim.lsp.buf.implementation)
	map("n", "gr", vim.lsp.buf.references)
	map("n", "K", vim.lsp.buf.hover)
	map("n", "<leader>rn", vim.lsp.buf.rename)
	map("n", "<leader>ca", vim.lsp.buf.code_action)
	map("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = false })
	end)
	map("n", "[d", vim.diagnostic.goto_prev)
	map("n", "]d", vim.diagnostic.goto_next)
	map("n", "<leader>ld", vim.diagnostic.open_float)
	map("n", "<leader>lq", vim.diagnostic.setloclist)

	-- 如果 LSP 服务器支持格式化功能，则在保存时自动格式化
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					async = false,
				}) -- 调用 LSP 格式化功能
			end,
		})
	end
end

-- 设置 LSP 客户端的能力，例如补全功能
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"ts_ls",
	"pyright",
	"gopls",
	"clangd",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		on_attach = on_attach,
		capabilities = capabilities,
	})
	vim.lsp.enable(server)
end
