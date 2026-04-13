# kekao's Neovim Config

> Neovim dotfiles tuned for a Lua-first workflow.
>
> Base project: [Neovim](https://github.com/neovim/neovim)  
> Updated: `2026-04-13`  
> Optimized with Codex

| Item | Value |
| --- | --- |
| Language | English / 中文 |
| Plugin Manager | `packer.nvim` |
| Leader | `Space` |
| UI | `kanagawa.nvim` + `lualine.nvim` + `noice.nvim` |
| Search | `telescope.nvim` + `flash.nvim` |
| LSP Stack | `mason.nvim` + `nvim-lspconfig` |
| Format / Lint | `conform.nvim` + `nvim-lint` |
| Git | `gitsigns.nvim` + `lazygit.nvim` |
| AI | `codex.nvim` + `Codex CLI` |

## Bootstrap

```bash
git clone <repo> ~/.config/nvim
nvim +PackerSync +PackerCompile
```

first run:

- `:PackerSync`
- `:PackerCompile`
- `:Mason`
- `:checkhealth`

## Docs

- [Chinese Entry](./README.zh-CN.md)
- [English Reference](./NEOVIM_USAGE.md)
- [Chinese Reference](./NEOVIM_USAGE.zh-CN.md)

## Quick Links

- [Codex CLI](https://github.com/openai/codex)
- [codex.nvim](https://github.com/johnseth97/codex.nvim)
- [init.lua](/Users/kekao/.config/nvim/init.lua:1)
- [lua/settings.lua](/Users/kekao/.config/nvim/lua/settings.lua:1)
- [lua/plugins.lua](/Users/kekao/.config/nvim/lua/plugins.lua:1)
- [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:1)

## Layout

| Path | Role |
| --- | --- |
| `init.lua` | bootstrap |
| `lua/settings.lua` | core options |
| `lua/plugins.lua` | packer spec |
| `lua/maps.lua` | global keymaps |
| `lua/configs/*.lua` | feature modules |
| `plugin/packer_compiled.lua` | generated packer loader |
| `README*.md` | entry docs |
| `NEOVIM_USAGE*.md` | reference docs |

<details>
<summary>Config Map</summary>

| Area | Entry |
| --- | --- |
| Bootstrap | [init.lua](/Users/kekao/.config/nvim/init.lua:1) |
| Core Options | [lua/settings.lua](/Users/kekao/.config/nvim/lua/settings.lua:1) |
| Plugin Spec | [lua/plugins.lua](/Users/kekao/.config/nvim/lua/plugins.lua:1) |
| Keymaps | [lua/maps.lua](/Users/kekao/.config/nvim/lua/maps.lua:1) |
| LSP | [lua/configs/lsp.lua](/Users/kekao/.config/nvim/lua/configs/lsp.lua:1) |
| Completion | [lua/configs/cmp.lua](/Users/kekao/.config/nvim/lua/configs/cmp.lua:1) |
| Formatting | [lua/configs/conform.lua](/Users/kekao/.config/nvim/lua/configs/conform.lua:1) |
| Lint | [lua/configs/lint.lua](/Users/kekao/.config/nvim/lua/configs/lint.lua:1) |
| Terminal | [lua/configs/toggleterm.lua](/Users/kekao/.config/nvim/lua/configs/toggleterm.lua:1) |
| Which-Key | [lua/configs/which-key.lua](/Users/kekao/.config/nvim/lua/configs/which-key.lua:1) |
| Codex | [lua/configs/codex.lua](/Users/kekao/.config/nvim/lua/configs/codex.lua:1) |

</details>

## Operations

```bash
nvim +PackerSync +PackerCompile
```

```bash
nvim +checkhealth
```

```bash
git status --short
```

routine commands:

- sync plugins: `:PackerSync`
- rebuild loader: `:PackerCompile`
- inspect LSP: `:LspInfo`
- inspect tooling: `:Mason`
- inspect runtime: `:checkhealth`

<details>
<summary>Feature Surface</summary>

- tree: `neo-tree.nvim`
- search: `telescope.nvim`
- diagnostics UI: `trouble.nvim`
- message UI: `noice.nvim`
- completion: `nvim-cmp`
- snippets: `LuaSnip`
- markdown preview: `markdown-preview.nvim`
- comments: `Comment.nvim`
- surround edits: `nvim-surround`
- sessions: `persistence.nvim`

</details>

## Notes

- Main usage reference lives in [NEOVIM_USAGE.md](./NEOVIM_USAGE.md).
- Chinese reference lives in [NEOVIM_USAGE.zh-CN.md](./NEOVIM_USAGE.zh-CN.md).
- This repo tracks both config source and generated `plugin/packer_compiled.lua`.

## Conventions

- keymaps are split between `lua/maps.lua` and feature-local config modules
- plugin setup lives under `lua/configs/`
- generated output is committed only after `:PackerCompile`
- docs should stay bilingual when behavior changes
