local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true }) -- 定义键映射函数，默认为静音模式
end

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
map("t", "<Esc>", [[<C-\><C-n>]]) --退出到普通模式
map("t", "<leader>q", [[<C-\><C-n>:q<CR>]]) --关闭终端

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

-- LazyGit 集成
map("n", "<leader>lg", "<CMD>LazyGit<CR>") -- 打开 LazyGit 界面
