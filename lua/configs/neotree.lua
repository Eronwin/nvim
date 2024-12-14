local status, neotree = pcall(require, "neo-tree")
if not status then
    return
end

neotree.setup({
    close_if_last_window = true, -- 如果 NeoTree 是最后一个窗口，自动关闭
    popup_border_style = "rounded", -- 边框样式
    enable_git_status = true, -- 启用 Git 状态显示
    enable_diagnostics = true, -- 启用诊断显示
    filesystem = {
        filtered_items = {
            hide_dotfiles = false, -- 显示隐藏文件
            hide_gitignored = true, -- 隐藏 .gitignore 中的文件
            hide_by_name = {
                "node_modules", -- 隐藏特定目录
            },
        },
        follow_current_file = true, -- 高亮当前文件
        hijack_netrw = true, -- 替换内置的 netrw
        use_libuv_file_watcher = true, -- 实时监听文件变化
    },
    buffers = {
        follow_current_file = true, -- 在缓冲区中高亮当前文件
        group_empty_dirs = true, -- 把空目录分组
    },
    git_status = {
        window = {
            position = "float", -- 使用浮动窗口显示 Git 状态
        },
    },
    default_component_configs = {
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
        },
        modified = { symbol = "[+]" }, -- 修改文件的标记
        git_status = {
            symbols = {
                added = "✚",
                modified = "",
                deleted = "✖",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "✗",
                staged = "✓",
                conflict = "",
            },
        },
    },
})