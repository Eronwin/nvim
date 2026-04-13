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
		require("conform").format({
			bufnr = bufnr,
			timeout_ms = 1000,
			lsp_fallback = true,
		})
	end)
	map("n", "[d", vim.diagnostic.goto_prev)
	map("n", "]d", vim.diagnostic.goto_next)
	map("n", "<leader>ld", vim.diagnostic.open_float)
	map("n", "<leader>lq", vim.diagnostic.setloclist)
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
