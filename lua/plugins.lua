-- Auto-compile packer
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

-- Plugins
return require("packer").startup(function(use)
	-- Core
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("rebelot/kanagawa.nvim")

	-- UI
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("configs.treesitter-context")
		end,
	})

	-- Search / motion
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("configs.which-key")
		end,
	})

	use({
		"johnseth97/codex.nvim",
		config = function()
			require("configs.codex")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("configs.notify")
		end,
	})

	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("configs.noice")
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.todo-comments")
		end,
	})

	use({
		"folke/flash.nvim",
		config = function()
			require("configs.flash")
		end,
	})

	use({
		"folke/persistence.nvim",
		config = function()
			require("configs.persistence")
		end,
	})

	-- LSP / tooling
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lsp")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	})

	use("onsails/lspkind-nvim")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	use({
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	})

	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("configs.lint")
		end,
	})

	-- Explorer / diagnostics
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("configs.neotree")
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.trouble")
		end,
	})

	-- Editing
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
	})

	-- Terminal / git
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("configs.toggleterm")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	})

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("configs.surround")
		end,
	})

	use({
		"kdheepak/lazygit.nvim",
		config = function()
			require("configs.lazygit")
		end,
	})

	-- Theme extras
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				enable = true,
				extra_groups = {
					"BufferLineTabClose",
					"BufferlineBufferSelected",
					"BufferLineFill",
					"BufferLineBackground",
					"BufferLineSeparator",
					"BufferLineIndicatorSelected",
				},
				exclude = {},
			})
		end,
	})
end)
