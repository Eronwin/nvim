# Neovim 使用手册

按当前配置整理。

- `leader` 键是空格
- 下面的快捷键来自这几处配置：
  - [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:1)
  - [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:1)
  - [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:1)
  - [lua/configs/toggleterm.lua](/Users/kekao/.config/nvim/lua/configs/toggleterm.lua:1)
- 我已经按配置全局检查过一遍，当前自己写出来的按键都在这里

## 基本

- 行号：开启
- 相对行号：开启
- 系统剪贴板：开启
- 缩进：`tabstop = 4`，`shiftwidth = 4`
- 新水平分屏开在下方
- 新垂直分屏开在右侧

配置入口：

- [init.lua](/Users/kekao/.config/nvim/init.lua:1)
- [lua/settings.lua](/Users/kekao/.config/nvim/lua/settings.lua:1)
- [lua/plugins.lua](/Users/kekao/.config/nvim/lua/plugins.lua:1)

## 插件

当前启用的插件：

- `packer.nvim`
- `plenary.nvim`
- `nvim-web-devicons`
- `kanagawa.nvim`
- `lualine.nvim`
- `nvim-treesitter`
- `nvim-ts-autotag`
- `telescope.nvim`
- `mason.nvim`
- `mason-lspconfig.nvim`
- `nvim-lspconfig`
- `lspkind-nvim`
- `LuaSnip`
- `nvim-cmp`
- `cmp-nvim-lsp`
- `cmp-path`
- `cmp-buffer`
- `none-ls.nvim`
- `neo-tree.nvim`
- `nvim-colorizer.lua`
- `toggleterm.nvim`
- `gitsigns.nvim`
- `nvim-autopairs`
- `nvim-transparent`

当前注释掉，没有启用：

- `markdown-preview.nvim`
- `lazygit.nvim`

## 常用命令

插件管理：

- `:PackerSync`
- `:PackerCompile`
- `:PackerStatus`

LSP 和工具：

- `:Mason`
- `:LspInfo`
- `:checkhealth`

Treesitter：

- `:TSInstall <lang>`
- `:TSUpdate`

Git：

- `:Gitsigns preview_hunk`
- `:Gitsigns next_hunk`
- `:Gitsigns prev_hunk`
- `:Gitsigns toggle_current_line_blame`

## 快捷键总表

### 普通模式

| 按键 | 实际按法 | 作用 | 来源 |
| --- | --- | --- | --- |
| `<leader>ff` | `Space ff` | Telescope 查找文件 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:9) |
| `<leader>fg` | `Space fg` | Telescope 全局搜索 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:10) |
| `<leader>fb` | `Space fb` | Telescope 列出 buffer | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:11) |
| `<leader>fh` | `Space fh` | Telescope 帮助 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:12) |
| `<leader>fs` | `Space fs` | Telescope Git 状态 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:13) |
| `<leader>fc` | `Space fc` | Telescope Git 提交 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:14) |
| `<leader>w` | `Space w` | 保存文件 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:20) |
| `<leader>q` | `Space q` | 退出当前窗口 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:23) |
| `<leader>n` | `Space n` | 垂直分屏 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:29) |
| `<leader>p` | `Space p` | 水平分屏 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:30) |
| `<leader>e` | `Space e` | 打开或关闭 Neo-tree | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:33) |
| `<leader>o` | `Space o` | 聚焦到 Neo-tree | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:34) |
| `<leader>er` | `Space er` | 在 Neo-tree 中定位当前文件 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:35) |
| `<Tab>` | `Tab` | 下一个 buffer | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:37) |
| `<S-Tab>` | `Shift-Tab` | 上一个 buffer | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:38) |
| `<leader>th` | `Space th` | 打开水平终端 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:41) |
| `<leader>tv` | `Space tv` | 打开垂直终端 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:42) |
| `]h` | `]h` | 下一个 Git hunk | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:47) |
| `[h` | `[h` | 上一个 Git hunk | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:48) |
| `<leader>hp` | `Space hp` | 预览当前 hunk | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:49) |
| `<leader>hb` | `Space hb` | 切换当前行 blame | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:50) |
| `<C-h>` | `Ctrl-h` | 切到左边窗口 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:51) |
| `<C-j>` | `Ctrl-j` | 切到下面窗口 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:54) |
| `<C-k>` | `Ctrl-k` | 切到上面窗口 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:53) |
| `<C-l>` | `Ctrl-l` | 切到右边窗口 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:52) |
| `<C-Left>` | `Ctrl-Left` | 窗口向左缩 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:57) |
| `<C-Right>` | `Ctrl-Right` | 窗口向右扩 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:58) |
| `<C-Up>` | `Ctrl-Up` | 窗口向上扩 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:59) |
| `<C-Down>` | `Ctrl-Down` | 窗口向下缩 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:60) |
| `<F7>` | `F7` | 打开或关闭浮动终端 | [lua/configs/toggleterm.lua](/Users/kekao/.config/nvim/lua/configs/toggleterm.lua:10) |

### 插入模式

| 按键 | 实际按法 | 作用 | 来源 |
| --- | --- | --- | --- |
| `jk` | `j` 后接 `k` | 退出插入模式 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:26) |
| `<C-Space>` | `Ctrl-Space` | 触发补全 | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:18) |
| `<C-d>` | `Ctrl-d` | 补全文档上翻 | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:16) |
| `<C-f>` | `Ctrl-f` | 补全文档下翻 | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:17) |
| `<C-e>` | `Ctrl-e` | 关闭补全菜单 | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:19) |
| `<CR>` | `Enter` | 确认补全项 | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:20) |

### 终端模式

| 按键 | 实际按法 | 作用 | 来源 |
| --- | --- | --- | --- |
| `<Esc>` | `Esc` | 退出终端输入模式 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:43) |
| `<leader>q` | `Space q` | 关闭当前终端 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:44) |

### LSP 附加后可用

这些按键只在当前 buffer 挂上 LSP 之后可用。

| 按键 | 实际按法 | 作用 | 来源 |
| --- | --- | --- | --- |
| `gD` | `gD` | 跳到声明 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:6) |
| `gd` | `gd` | 跳到定义 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:7) |
| `gi` | `gi` | 跳到实现 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:8) |
| `gr` | `gr` | 查看引用 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:9) |
| `K` | `K` | 悬停文档 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:10) |
| `<leader>rn` | `Space rn` | 重命名符号 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:11) |
| `<leader>ca` | `Space ca` | 代码操作 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:12) |
| `<leader>lf` | `Space lf` | 手动格式化当前 buffer | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:13) |
| `[d` | `[d` | 上一个诊断 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:16) |
| `]d` | `]d` | 下一个诊断 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:17) |
| `<leader>ld` | `Space ld` | 查看当前诊断浮窗 | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:18) |
| `<leader>lq` | `Space lq` | 把诊断放进 location list | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:19) |

### 已写但没启用

这些按键现在不会生效，因为对应配置被注释掉了。

| 按键 | 实际按法 | 作用 | 来源 |
| --- | --- | --- | --- |
| `<leader>m` | `Space m` | Markdown 预览 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:47) |
| `<leader>mn` | `Space mn` | 停止 Markdown 预览 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:48) |
| `<leader>lg` | `Space lg` | 打开 LazyGit | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:63) |

## 功能说明

### Telescope

最常用的是这几个：

- `Space ff` 找文件
- `Space fg` 全局搜文本
- `Space fb` 看已打开的文件
- `Space fh` 查帮助

### Neo-tree

- `Space e` 开关文件树
- `Space o` 把光标切过去
- `Space er` 在文件树里定位当前文件

当前行为：

- 显示 dotfile
- 隐藏 `node_modules`
- 隐藏 `.gitignore`
- 跟随当前文件
- 显示 Git 状态和诊断

配置见 [lua/configs/neotree.lua](/Users/kekao/.config/nvim/lua/configs/neotree.lua:1)。

### ToggleTerm

有三种打开方式：

- `F7`：浮动终端
- `Space th`：水平终端
- `Space tv`：垂直终端

终端里：

- `Esc` 退出终端输入模式
- `Space q` 关闭终端

### 补全

补全来自：

- LSP
- 当前 buffer
- 文件路径

按键：

- `Ctrl-Space` 触发补全
- `Ctrl-d` / `Ctrl-f` 滚动说明
- `Ctrl-e` 关闭
- `Enter` 确认

配置见 [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:1)。

### LSP

当前启用：

- `ts_ls`
- `pyright`
- `gopls`
- `clangd`

另外 Mason 会安装这些：

- `cssls`
- `eslint`
- `html`
- `jsonls`
- `tailwindcss`
- `yamlls`

配置见：

- [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:1)
- [lua/configs/mason-lsp.lua](/Users/kekao/.config/nvim/lua/configs/mason-lsp.lua:1)

当前 LSP 键位：

- `gd` 跳定义
- `gD` 跳声明
- `gi` 跳实现
- `gr` 看引用
- `K` 看悬停文档
- `Space rn` 重命名
- `Space ca` 代码操作
- `Space lf` 手动格式化
- `[d` / `]d` 切换诊断
- `Space ld` 看当前诊断
- `Space lq` 把诊断放进列表

### 格式化和检查

保存时会自动格式化，只要当前 LSP 或 `none-ls` 支持格式化。

现在接着的工具有：

- `prettierd`
- `eslint_d`
- `prettier`
- `stylua`
- `rustfmt`
- `black`
- `shellcheck`
- `pylint`

配置见 [lua/configs/null-ls.lua](/Users/kekao/.config/nvim/lua/configs/null-ls.lua:1)。

### Git

当前键位：

- `]h` 下一个 hunk
- `[h` 上一个 hunk
- `Space hp` 预览 hunk
- `Space hb` 切换当前行 blame

### Treesitter

当前装的语言：

- `markdown`
- `tsx`
- `typescript`
- `javascript`
- `toml`
- `c_sharp`
- `json`
- `yaml`
- `rust`
- `css`
- `html`
- `lua`

配置见 [lua/configs/treesitter.lua](/Users/kekao/.config/nvim/lua/configs/treesitter.lua:1)。

## 备注

这份手册只收“你配置里明确写出来的快捷键”。

像下面这些功能虽然能用，但你现在没有给它们单独设键：

- LSP 跳定义、引用、重命名
- Gitsigns hunk 跳转
- Neo-tree 面板内部按键
- Telescope 面板内部按键

如果后面你把这些也配上，我再补进这份手册。
