local status, which_key = pcall(require, "which-key")
if not status then
	return
end

which_key.setup({})

which_key.add({
	{ "<leader>f", group = "Find" },
	{ "<leader>e", group = "Explorer" },
	{ "<leader>c", group = "Codex / Code" },
	{ "<leader>h", group = "Git Hunk" },
	{ "<leader>s", group = "Session / Search" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>x", group = "Trouble" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>m", group = "Markdown" },

	{ "<leader>w", desc = "Save" },
	{ "<leader>cc", desc = "Toggle Codex" },
	{ "<leader>q", desc = "Quit Window" },
	{ "<leader>n", desc = "Split Vertical" },
	{ "<leader>p", desc = "Split Horizontal" },

	{ "<leader>ff", desc = "Find Files" },
	{ "<leader>fg", desc = "Live Grep" },
	{ "<leader>fb", desc = "Buffers" },
	{ "<leader>fh", desc = "Help Tags" },
	{ "<leader>fs", desc = "Git Status" },
	{ "<leader>fc", desc = "Git Commits" },

	{ "<leader>ee", desc = "Toggle Explorer" },
	{ "<leader>eo", desc = "Focus Explorer" },
	{ "<leader>er", desc = "Reveal Current File" },

	{ "<leader>th", desc = "Terminal Horizontal" },
	{ "<leader>tv", desc = "Terminal Vertical" },

	{ "<leader>hp", desc = "Preview Hunk" },
	{ "<leader>hb", desc = "Toggle Line Blame" },
	{ "<leader>lg", desc = "LazyGit" },
	{ "<leader>st", desc = "Todo Telescope" },
	{ "<leader>ss", desc = "Restore Session" },
	{ "<leader>sl", desc = "Restore Last Session" },
	{ "<leader>sd", desc = "Stop Session Save" },

	{ "<leader>xx", desc = "Diagnostics" },
	{ "<leader>xX", desc = "Buffer Diagnostics" },
	{ "<leader>xq", desc = "Quickfix" },
	{ "<leader>xl", desc = "Location List" },

	{ "<leader>mp", desc = "Markdown Preview" },
	{ "<leader>ms", desc = "Markdown Preview Stop" },

	{ "<leader>rn", desc = "Rename" },
	{ "<leader>ca", desc = "Code Action" },
	{ "<leader>lf", desc = "Format Buffer" },
	{ "<leader>ld", desc = "Line Diagnostics" },
	{ "<leader>lq", desc = "Diagnostics List" },
})
