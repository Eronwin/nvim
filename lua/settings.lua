local global = vim.g
local o = vim.o

vim.scriptencoding = "utf-8"

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
