<h1 align="center">kekao 的 Neovim 配置</h1>

<p align="center">
  一套偏 Lua 工作流的 Neovim 配置。
</p>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README.zh-CN.md">简体中文</a>
</p>

<p align="center">
  <img alt="Neovim" src="https://img.shields.io/badge/Neovim-0.11+-57A143?logo=neovim&logoColor=white">
  <img alt="Lua" src="https://img.shields.io/badge/Lua-config-2C2D72?logo=lua&logoColor=white">
  <img alt="Packer" src="https://img.shields.io/badge/Plugin_Manager-packer.nvim-1F6FEB">
  <img alt="LSP" src="https://img.shields.io/badge/LSP-mason%20%2B%20lspconfig-0A7EA4">
  <img alt="Codex" src="https://img.shields.io/badge/AI-Codex-111111">
</p>

<p align="center">
  基础项目：<a href="https://github.com/neovim/neovim">Neovim</a> ·
  更新日期：<code>2026-04-13</code> ·
  已由 Codex 优化
</p>

| 项目 | 值 |
| --- | --- |
| 语言 | 中文 / English |
| 插件管理 | `packer.nvim` |
| Leader | `Space` |
| UI | `kanagawa.nvim` + `lualine.nvim` + `noice.nvim` |
| 搜索 | `telescope.nvim` + `flash.nvim` |
| LSP 栈 | `mason.nvim` + `nvim-lspconfig` |
| 格式化 / Lint | `conform.nvim` + `nvim-lint` |
| Git | `gitsigns.nvim` + `lazygit.nvim` |
| AI | `codex.nvim` + `Codex CLI` |

## 初始化

```bash
git clone <repo> ~/.config/nvim
nvim +PackerSync +PackerCompile
```

首次启动建议：

- `:PackerSync`
- `:PackerCompile`
- `:Mason`
- `:checkhealth`

## 文档

- [英文入口](./README.md)
- [中文手册](./NEOVIM_USAGE.zh-CN.md)
- [English Reference](./NEOVIM_USAGE.md)

## 快速入口

- [Codex CLI](https://github.com/openai/codex)
- [codex.nvim](https://github.com/johnseth97/codex.nvim)
- [init.lua](/Users/kekao/.config/nvim/init.lua:1)
- [lua/settings.lua](/Users/kekao/.config/nvim/lua/settings.lua:1)
- [lua/plugins.lua](/Users/kekao/.config/nvim/lua/plugins.lua:1)
- [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:1)

## 目录

| 路径 | 作用 |
| --- | --- |
| `init.lua` | 启动入口 |
| `lua/settings.lua` | 基础选项 |
| `lua/plugins.lua` | packer 插件定义 |
| `lua/maps.lua` | 全局键位 |
| `lua/configs/*.lua` | 功能模块 |
| `plugin/packer_compiled.lua` | packer 生成加载器 |
| `README*.md` | 入口文档 |
| `NEOVIM_USAGE*.md` | 使用手册 |

<details>
<summary>配置索引</summary>

| 模块 | 入口 |
| --- | --- |
| 启动 | [init.lua](/Users/kekao/.config/nvim/init.lua:1) |
| 基础选项 | [lua/settings.lua](/Users/kekao/.config/nvim/lua/settings.lua:1) |
| 插件定义 | [lua/plugins.lua](/Users/kekao/.config/nvim/lua/plugins.lua:1) |
| 键位 | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:1) |
| LSP | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:1) |
| 补全 | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:1) |
| 格式化 | [lua/configs/conform.lua](/Users/kekao/.config/nvim/lua/configs/conform.lua:1) |
| Lint | [lua/configs/lint.lua](/Users/kekao/.config/nvim/lua/configs/lint.lua:1) |
| 终端 | [lua/configs/toggleterm.lua](/Users/kekao/.config/nvim/lua/configs/toggleterm.lua:1) |
| Which-Key | [lua/configs/which-key.lua](/Users/kekao/.config/nvim/lua/configs/which-key.lua:1) |
| Codex | [lua/configs/codex.lua](/Users/kekao/.config/nvim/lua/configs/codex.lua:1) |

</details>

## 常用操作

```bash
nvim +PackerSync +PackerCompile
```

```bash
nvim +checkhealth
```

```bash
git status --short
```

日常命令：

- 同步插件：`:PackerSync`
- 重建加载器：`:PackerCompile`
- 查看 LSP：`:LspInfo`
- 查看工具链：`:Mason`
- 检查运行时：`:checkhealth`

<details>
<summary>功能面</summary>

- 文件树：`neo-tree.nvim`
- 搜索：`telescope.nvim`
- 诊断面板：`trouble.nvim`
- 消息界面：`noice.nvim`
- 补全：`nvim-cmp`
- 代码片段：`LuaSnip`
- Markdown 预览：`markdown-preview.nvim`
- 注释：`Comment.nvim`
- surround 编辑：`nvim-surround`
- 会话：`persistence.nvim`

</details>

## 说明

- 主手册见 [NEOVIM_USAGE.zh-CN.md](./NEOVIM_USAGE.zh-CN.md)。
- 英文手册见 [NEOVIM_USAGE.md](./NEOVIM_USAGE.md)。
- 仓库同时跟踪配置源码和生成文件 `plugin/packer_compiled.lua`。

## 约定

- 键位分散在 `lua/maps.lua` 和各功能模块里
- 插件配置统一放在 `lua/configs/`
- `:PackerCompile` 之后再提交生成文件
- 行为改动时，中英文文档一起更新
