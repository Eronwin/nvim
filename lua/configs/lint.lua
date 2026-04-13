local status, lint = pcall(require, "lint")
if not status then
	return
end

local function has(bin)
	return vim.fn.executable(bin) == 1
end

lint.linters_by_ft = {}

if has("eslint_d") then
	lint.linters_by_ft.javascript = { "eslint_d" }
	lint.linters_by_ft.javascriptreact = { "eslint_d" }
	lint.linters_by_ft.typescript = { "eslint_d" }
	lint.linters_by_ft.typescriptreact = { "eslint_d" }
end

if has("pylint") then
	lint.linters_by_ft.python = { "pylint" }
end

if has("shellcheck") then
	lint.linters_by_ft.sh = { "shellcheck" }
	lint.linters_by_ft.bash = { "shellcheck" }
	lint.linters_by_ft.zsh = { "shellcheck" }
end

local augroup = vim.api.nvim_create_augroup("NvimLint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = augroup,
	callback = function()
		require("lint").try_lint()
	end,
})
