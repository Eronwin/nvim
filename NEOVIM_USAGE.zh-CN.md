# Neovim 参考

## Meta

- language: `zh-CN`
- leader：`Space`
- 插件管理：`packer.nvim`

键位来源：

- [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:1)
- [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:1)
- [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:1)
- [lua/configs/toggleterm.lua](/Users/kekao/.config/nvim/lua/configs/toggleterm.lua:1)

配置入口：

- [init.lua](/Users/kekao/.config/nvim/init.lua:1)
- [lua/settings.lua](/Users/kekao/.config/nvim/lua/settings.lua:1)
- [lua/plugins.lua](/Users/kekao/.config/nvim/lua/plugins.lua:1)

## Core

- 行号：开启
- 相对行号：开启
- 剪贴板：`unnamedplus`
- 缩进：`tabstop=4`, `shiftwidth=4`
- `splitbelow`：开启
- `splitright`：开启

## Plugin Set

- `packer.nvim`
- `plenary.nvim`
- `nvim-web-devicons`
- `kanagawa.nvim`
- `lualine.nvim`
- `nvim-treesitter`
- `nvim-ts-autotag`
- `nvim-treesitter-context`
- `telescope.nvim`
- `which-key.nvim`
- `codex.nvim`
- `nvim-notify`
- `noice.nvim`
- `todo-comments.nvim`
- `flash.nvim`
- `persistence.nvim`
- `mason.nvim`
- `mason-lspconfig.nvim`
- `nvim-lspconfig`
- `lspkind-nvim`
- `LuaSnip`
- `nvim-cmp`
- `cmp-nvim-lsp`
- `cmp-path`
- `cmp-buffer`
- `conform.nvim`
- `nvim-lint`
- `neo-tree.nvim`
- `trouble.nvim`
- `nvim-colorizer.lua`
- `Comment.nvim`
- `markdown-preview.nvim`
- `toggleterm.nvim`
- `gitsigns.nvim`
- `lazygit.nvim`
- `nvim-autopairs`
- `nvim-surround`
- `nvim-transparent`

## Commands

插件管理：

- `:PackerSync`
- `:PackerCompile`
- `:PackerStatus`

LSP / tooling：

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

## Keymaps

### Normal

| key | action |
| --- | --- |
| `Space ff` | Telescope 文件搜索 |
| `Space fg` | Telescope 全局搜索 |
| `Space fb` | Telescope buffers |
| `Space fh` | Telescope help |
| `Space fs` | Telescope git status |
| `Space fc` | Telescope git commits |
| `Space w` | 保存 buffer |
| `Space cc` | 切换 Codex 面板 |
| `Space q` | 关闭窗口 |
| `Space n` | 垂直分屏 |
| `Space p` | 水平分屏 |
| `Space ee` | 切换 Neo-tree |
| `Space eo` | 聚焦 Neo-tree |
| `Space er` | 在 Neo-tree 中定位当前文件 |
| `Tab` | 下一个 buffer |
| `Shift-Tab` | 上一个 buffer |
| `Space th` | 水平终端 |
| `Space tv` | 垂直终端 |
| `]h` | 下一个 hunk |
| `[h` | 上一个 hunk |
| `Space hp` | 预览 hunk |
| `Space hb` | 切换当前行 blame |
| `Space lg` | LazyGit |
| `Space st` | Todo Telescope |
| `Space ss` | 恢复会话 |
| `Space sl` | 恢复上一个会话 |
| `Space sd` | 停止会话持久化 |
| `Space xx` | Trouble diagnostics |
| `Space xX` | Trouble diagnostics, current buffer |
| `Space xq` | Trouble quickfix |
| `Space xl` | Trouble location list |
| `Space mp` | 启动 Markdown 预览 |
| `Space ms` | 停止 Markdown 预览 |
| `s` | Flash jump |
| `S` | Flash Treesitter jump |
| `Ctrl-h` | 窗口左移 |
| `Ctrl-j` | 窗口下移 |
| `Ctrl-k` | 窗口上移 |
| `Ctrl-l` | 窗口右移 |
| `Ctrl-Left` | 向左缩放窗口 |
| `Ctrl-Right` | 向右缩放窗口 |
| `Ctrl-Up` | 向上缩放窗口 |
| `Ctrl-Down` | 向下缩放窗口 |
| `F7` | 切换浮动终端 |

### Insert

| key | action |
| --- | --- |
| `jk` | 回到 normal mode |
| `Ctrl-Space` | 触发补全 |
| `Ctrl-d` | 补全文档上翻 |
| `Ctrl-f` | 补全文档下翻 |
| `Ctrl-e` | 关闭补全 |
| `Enter` | 确认补全 |

### Terminal

| key | action |
| --- | --- |
| `Esc` | terminal-normal mode |
| `Space q` | 关闭终端窗口 |

### LSP Buffer

仅在 LSP attach 后有效：

| key | action |
| --- | --- |
| `gD` | declaration |
| `gd` | definition |
| `gi` | implementation |
| `gr` | references |
| `K` | hover |
| `Space rn` | rename |
| `Space ca` | code action |
| `Space lf` | format buffer |
| `[d` | previous diagnostic |
| `]d` | next diagnostic |
| `Space ld` | line diagnostics |
| `Space lq` | diagnostics location list |

## Plugin Notes

### Which-key

leader 分组：

- `c` codex / code
- `e` explorer
- `f` find
- `h` git hunk
- `l` lsp
- `m` markdown
- `s` session / search
- `t` terminal
- `x` trouble

### Codex

- `Space cc` 切换 Codex 面板
- 依赖本机 `codex` CLI

### Noice / Notify / Nui

- `noice.nvim`：命令行、消息、LSP UI
- `nvim-notify`：通知显示
- `nui.nvim`：共享 UI 依赖

### Neo-tree

- dotfiles：显示
- `.gitignore`：隐藏
- `node_modules`：隐藏
- follow current file：开启
- git status：开启
- diagnostics：开启

配置：

- [lua/configs/neotree.lua](/Users/kekao/.config/nvim/lua/configs/neotree.lua:1)

### Treesitter Context

- 顶部固定当前语法上下文

### Todo Comments

- `Space st` 搜索 `TODO`、`FIXME`、`NOTE`

### Persistence

- `Space ss` 恢复当前目录会话
- `Space sl` 恢复上一个会话
- `Space sd` 停止当前会话持久化

### Flash

- `s` jump
- `S` Treesitter jump

### Markdown Preview

- 仅在 markdown filetype 下懒加载
- `Space mp` 启动
- `Space ms` 停止

### Completion

sources：

- LSP
- buffer
- path

配置：

- [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:1)

### Surround

默认键位，非自定义映射：

- `ysiw"` 给单词加引号
- `ysiw)` 给单词加括号
- `ds"` 删除引号
- `cs"'` 把 `"` 改成 `'`
- visual `S` 添加 surround

### Comment

默认键位，非自定义映射：

- `gcc` 切换当前行注释
- `gc{motion}` 切换 motion 注释
- visual `gc` 切换选区注释

### LSP

启用服务：

- `ts_ls`
- `pyright`
- `gopls`
- `clangd`

Mason 安装集：

- `cssls`
- `eslint`
- `html`
- `jsonls`
- `tailwindcss`
- `yamlls`

配置：

- [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:1)
- [lua/configs/mason-lsp.lua](/Users/kekao/.config/nvim/lua/configs/mason-lsp.lua:1)

### Formatting

formatter stack：

- `stylua`
- `black`
- `prettierd`
- `prettier`

save path：

- `conform.nvim`
- 启用 LSP fallback

配置：

- [lua/configs/conform.lua](/Users/kekao/.config/nvim/lua/configs/conform.lua:1)

### Lint

linters：

- `eslint_d`
- `pylint`
- `shellcheck`

trigger：

- `BufEnter`
- `BufWritePost`
- `InsertLeave`

配置：

- [lua/configs/lint.lua](/Users/kekao/.config/nvim/lua/configs/lint.lua:1)
