local status, lazygit = pcall(require, "lazygit")
if not status then
	return
end

lazygit.setup({
	-- 可自定义选项，根据需要添加 LazyGit 的配置
	float_opts = {
		border = "rounded", -- 浮动窗口边框样式
		width = 100, -- 浮动窗口宽度
		height = 30, -- 浮动窗口高度
		row = 2, -- 窗口相对顶部的位置
		col = 2, -- 窗口相对左侧的位置
	},
	use_terminal = true, -- 是否在终端模式下运行 LazyGit
})
