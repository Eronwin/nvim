

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
