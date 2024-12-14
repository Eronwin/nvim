# Neovim编辑器配置 / kekao‘s Neovim Config



> 本项目是一个自定义的Neovim配置 
>
> 方便追溯且开源
>
> [Neovim Project](https://github.com/neovim/neovim)



## 设置setting.lua

```lua
-- 设置 <leader> 键
global.mapleader = " "
global.maplocalleader = " "

-- 编辑器选项
o.number = true -- 显示行号
o.relativenumber = true -- 显示相对行号
o.clipboard = "unnamedplus" -- 使用系统剪贴板进行复制和粘贴
o.syntax = "on" -- 启用语法高亮
o.autoindent = true -- 自动缩进新行
o.cursorline = true -- 高亮光标所在行
o.expandtab = true -- 使用空格代替 Tab
o.shiftwidth = 4 -- 自动缩进时使用 2 个空格
o.tabstop = 4 -- 一个 Tab 字符的宽度为 2 个空格
o.encoding = "utf-8" -- 设置文件内部使用的字符编码
o.fileencoding = "utf-8" -- 设置文件的编码格式
o.ruler = true -- 显示光标所在行列的位置
o.mouse = "a" -- 启用鼠标支持，适用于所有模式
o.title = true -- 启用窗口标题显示
o.hidden = true -- 允许在不保存的情况下切换缓冲区
o.ttimeoutlen = 0 -- 等待键代码或映射键序列完成的时间（毫秒）
o.wildmenu = true -- 启用命令行补全的增强模式
o.showcmd = true -- 显示（部分）命令在屏幕底部
o.showmatch = true -- 输入括号时，短暂跳转到匹配的括号
o.inccommand = "split" -- 实时预览 :substitute 等命令的效果
o.splitbelow = true -- 新窗口在当前窗口下方打开
o.splitright = true -- 新窗口在当前窗口右侧打开
```

## 映射maps.lua

```lua
-- 安全加载 Telescope 插件
local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope 快捷键映射
    map("n", "<leader>ff", telescope.find_files) -- 查找文件
    map("n", "<leader>fg", telescope.live_grep) -- 全局搜索
    map("n", "<leader>fb", telescope.buffers) -- 列出所有缓冲区
    map("n", "<leader>fh", telescope.help_tags) -- 查找帮助标签
    map("n", "<leader>fs", telescope.git_status) -- 查看 Git 状态
    map("n", "<leader>fc", telescope.git_commits) -- 查看 Git 提交历史
else
    print("Telescope not found") -- 如果插件未找到，打印提示信息
end

-- 保存文件
map("n", "<leader>w", "<CMD>update<CR>")

-- 退出 Neovim
map("n", "<leader>q", "<CMD>q<CR>")

-- 退出插入模式
map("i", "jk", "<ESC>")

-- 窗口操作
map("n", "<leader>n", "<CMD>vsplit<CR>") -- 垂直分割窗口
map("n", "<leader>p", "<CMD>split<CR>") -- 水平分割窗口

-- NeoTree 文件管理
map("n", "<leader>e", "<CMD>Neotree toggle<CR>") -- 切换 NeoTree 界面
map("n", "<leader>o", "<CMD>Neotree focus<CR>") -- 焦点切换到 NeoTree 界面

-- 缓冲区导航
map("n", "<TAB>", "<CMD>bnext<CR>") -- 切换到下一个缓冲区
map("n", "<S-TAB>", "<CMD>bprevious<CR>") -- 切换到上一个缓冲区

-- 终端操作
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>") -- 水平终端
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>") -- 垂直终端

-- Markdown 预览
-- map("n", "<leader>m", "<CMD>MarkdownPreview<CR>") -- 启动 Markdown 预览
-- map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>") -- 停止 Markdown 预览

-- 窗口导航
map("n", "<C-h>", "<C-w>h") -- 切换到左侧窗口
map("n", "<C-l>", "<C-w>l") -- 切换到右侧窗口
map("n", "<C-k>", "<C-w>k") -- 切换到上方窗口
map("n", "<C-j>", "<C-w>j") -- 切换到下方窗口

-- 窗口大小调整
map("n", "<C-Left>", "<C-w><") -- 向左调整窗口大小
map("n", "<C-Right>", "<C-w>>") -- 向右调整窗口大小
map("n", "<C-Up>", "<C-w>+") -- 向上调整窗口大小
map("n", "<C-Down>", "<C-w>-") -- 向下调整窗口大小
```

## 插件plugins.lua

```lua
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
        tag = "0.1.1", -- 使用特定版本的 tag
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
```

