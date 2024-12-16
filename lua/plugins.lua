-- 自动运行：PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }), -- 创建一个新的自动命令组
	pattern = "plugins.lua", -- 当保存 plugins.lua 文件时触发
	command = "source <afile> | PackerCompile", -- 执行 source 和 PackerCompile 命令
})

-- 使用 packer 来管理插件
return require("packer").startup(function(use)
	-- Packer 本身
	use("wbthomason/packer.nvim")

	-- 常用实用工具
	use("nvim-lua/plenary.nvim")

	-- 图标支持
	use("nvim-tree/nvim-web-devicons")

	-- 颜色主题：kanagawa
	use("rebelot/kanagawa.nvim")

	-- 状态栏配置
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter", -- 当进入缓冲区时加载
		config = function()
			require("configs.lualine") -- 使用自定义的 lualine 配置
		end,
		requires = { "nvim-web-devicons" }, -- 依赖图标插件
	})

	-- Treesitter 插件，用于更好的语法高亮和解析
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true }) -- 同步更新 Treesitter 解析器
		end,
		config = function()
			require("configs.treesitter") -- 使用自定义的 Treesitter 配置
		end,
	})

	-- 自动闭合标签（依赖 Treesitter）
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope 插件，强大的模糊搜索工具
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } }, -- 依赖 plenary.nvim
	})

	-- Mason：可移植的包管理器
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup() -- 初始化 mason
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lsp") -- 使用自定义的 mason-lsp 配置
		end,
	})

	-- LSP 配置
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp") -- 使用自定义的 LSP 配置
		end,
	})

	use("onsails/lspkind-nvim") -- LSP 图标
	use({
		"L3MON4D3/LuaSnip",
		tag = "v<CurrentMajor>.*", -- 使用最新的主要版本
	})

	-- 自动补全插件
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp") -- 使用自定义的 cmp 配置
		end,
	})

	use("hrsh7th/cmp-nvim-lsp") -- LSP 补全源
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" }) -- 文件路径补全
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" }) -- 缓冲区内容补全

	-- LSP 诊断、代码操作等
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls") -- 使用自定义的 null-ls 配置
		end,
		requires = { "nvim-lua/plenary.nvim" }, -- 依赖 plenary.nvim
	})

	-- 文件管理器插件：NeoTree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim", -- 依赖 plenary.nvim
			"nvim-tree/nvim-web-devicons", -- 依赖图标插件
			"MunifTanjim/nui.nvim", -- 依赖 UI 库
		},
		config = function()
			require("configs.neotree") -- 加载自定义配置
		end,
	})

	-- 显示颜色插件
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }) -- 对所有文件类型启用
		end,
	})

	-- 终端集成插件
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("configs.toggleterm") -- 使用自定义的 toggleterm 配置
		end,
	})

	-- Git 集成插件
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns") -- 使用自定义的 gitsigns 配置
		end,
	})

	-- Markdown 预览插件
	-- use({
	--     "iamcco/markdown-preview.nvim",
	--     run = function()
	--         vim.fn["mkdp#util#install"]() -- 安装 Markdown 预览依赖
	--     end,
	-- })

	-- 自动补全括号插件
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs") -- 使用自定义的 autopairs 配置
		end,
	})

	-- lazygit gui工具
	--	use({
	--	    "kdheepak/lazygit.nvim",
	--	    config = function()
	--		    require("configs.lazygit") -- 使用自定义的 lazygit 配置
	--	    end,
	--  })

	-- 背景透明插件
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				enable = true, -- 启用背景透明
				extra_groups = {
					"BufferLineTabClose",
					"BufferlineBufferSelected",
					"BufferLineFill",
					"BufferLineBackground",
					"BufferLineSeparator",
					"BufferLineIndicatorSelected",
				},
				exclude = {}, -- 不透明的组件
			})
		end,
	})
end)
