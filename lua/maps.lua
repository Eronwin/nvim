local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local flash_status, flash = pcall(require, "flash")
local function in_git_repo()
	local cwd = vim.fn.expand("%:p:h")
	if cwd == "" then
		cwd = vim.loop.cwd()
	end

	return vim.fn.system({
		"git",
		"-C",
		cwd,
		"rev-parse",
		"--is-inside-work-tree",
	}) ~= ""
		and vim.v.shell_error == 0
end

-- Telescope
local status, telescope = pcall(require, "telescope.builtin")
if status then
	local function git_status()
		if not in_git_repo() then
			vim.notify("Current file is not inside a Git repository", vim.log.levels.WARN)
			return
		end
		telescope.git_status()
	end

	local function git_commits()
		if not in_git_repo() then
			vim.notify("Current file is not inside a Git repository", vim.log.levels.WARN)
			return
		end
		telescope.git_commits()
	end

	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", git_status)
	map("n", "<leader>fc", git_commits)
else
	print("Telescope not found")
end

-- Core
map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>cc", "<CMD>CodexToggle<CR>")

map("n", "<leader>q", "<CMD>q<CR>")

-- Insert
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>n", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Explorer
map("n", "<leader>ee", "<CMD>Neotree toggle<CR>")
map("n", "<leader>eo", "<CMD>Neotree focus<CR>")
map("n", "<leader>er", "<CMD>Neotree reveal<CR>")

-- Buffers
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")
map("t", "<Esc>", [[<C-\><C-n>]])
map("t", "<leader>q", [[<C-\><C-n>:q<CR>]])

-- Git
map("n", "]h", "<CMD>Gitsigns next_hunk<CR>")
map("n", "[h", "<CMD>Gitsigns prev_hunk<CR>")
map("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>")
map("n", "<leader>hb", "<CMD>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>lg", "<CMD>LazyGit<CR>")

-- Trouble
map("n", "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>")
map("n", "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
map("n", "<leader>xq", "<CMD>Trouble qflist toggle<CR>")
map("n", "<leader>xl", "<CMD>Trouble loclist toggle<CR>")
map("n", "<leader>st", "<CMD>TodoTelescope<CR>")
map("n", "<leader>ss", "<CMD>lua require('persistence').load()<CR>")
map("n", "<leader>sl", "<CMD>lua require('persistence').load({ last = true })<CR>")
map("n", "<leader>sd", "<CMD>lua require('persistence').stop()<CR>")

-- Markdown
map("n", "<leader>mp", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>ms", "<CMD>MarkdownPreviewStop<CR>")

if flash_status then
	map({ "n", "x", "o" }, "s", function()
		flash.jump()
	end)
	map({ "n", "x", "o" }, "S", function()
		flash.treesitter()
	end)
	map("o", "r", function()
		flash.remote()
	end)
end

-- Window nav
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Window resize
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
