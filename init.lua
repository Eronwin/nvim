
if vim.islist then
	rawset(vim, "tbl_islist", vim.islist)
end

if vim.iter then
	rawset(vim, "tbl_flatten", function(t)
		return vim.iter(t):flatten(math.huge):totable()
	end)
end

require("settings")
require("plugins")
require("maps") -- 键映射

-- 配色方案配置：kanagawa
local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
    vim.cmd("colorscheme kanagawa")
else
    return
end
