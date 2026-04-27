# Neovim Config

A personal Neovim config based on Kickstart, tuned for TypeScript/Lua/web work.

## Requirements

- Neovim `0.11+`
- Nerd Font (enabled in config)
- `git`, `node`, `ripgrep`

## Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/YOUR_USERNAME/nvim-config ~/.config/nvim
nvim
```

On first launch, `lazy.nvim` installs plugins and Mason installs LSP tools.

## Layout

```text
init.lua
lua/kickstart/plugins/
  colorscheme.lua
  markdown.lua
  neo-tree.lua
  tabs.lua
```

## Core Plugins

- `nvim-telescope/telescope.nvim`
- `nvim-treesitter/nvim-treesitter`
- `neovim/nvim-lspconfig` + Mason (`mason.nvim`, `mason-lspconfig.nvim`, `mason-tool-installer.nvim`)
- `saghen/blink.cmp`
- `stevearc/conform.nvim`
- `lewis6991/gitsigns.nvim`
- `nvim-neo-tree/neo-tree.nvim`
- `akinsho/bufferline.nvim`
- `MeanderingProgrammer/render-markdown.nvim`
- `rebelot/kanagawa.nvim`

## Current LSP Servers

Configured servers:

- `vtsls`
- `tailwindcss`
- `lua_ls`

## Keymaps

Leader is `<Space>`.

### Navigation

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |
| `<leader><leader>` | Find open buffers |
| `<C-h/j/k/l>` | Move between windows |
| `<S-h>` / `<S-l>` | Previous / next buffer tab |
| `<leader>bx` | Close current buffer |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (hidden + dropdown UI) |
| `<leader>fF` | Find all files (includes ignored) |
| `<leader>sf` | Search files (hidden + dropdown UI) |
| `<leader>sg` | Live grep project |
| `<leader>sw` | Grep word under cursor |
| `<leader>s/` | Live grep open files |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>s.` | Recent files |
| `<leader>sd` | Diagnostics |
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>sr` | Resume last picker |
| `<leader>sn` | Search Neovim config |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `grD` | Go to declaration |
| `grr` | References |
| `gri` | Implementations |
| `grd` | Definitions (Telescope picker) |
| `grt` | Type definitions |
| `gO` / `gW` | Document / workspace symbols |
| `grn` | Rename |
| `gra` | Code action |
| `K` | Hover docs |
| `gK` | Signature help |
| `<C-k>` (insert mode) | Signature help |
| `<leader>th` | Toggle inlay hints |

### Formatting

| Key | Action |
|-----|--------|
| `<leader>cf` | Format buffer |

Format on save is enabled through `conform.nvim`.

### Terminal

| Key | Action |
|-----|--------|
| `<Esc><Esc>` | Exit terminal mode |

### UI Notes

- `<Esc>` in normal mode closes floating windows and clears search highlight.
- Neo-tree is bound to `<leader>e` and can also be closed from inside the tree with `<leader>e`.
- Markdown rendering is enabled for `.md` files via `render-markdown.nvim`.

## Customizing

- Main config: `init.lua`
- Markdown rendering: `lua/kickstart/plugins/markdown.lua`
- File tree: `lua/kickstart/plugins/neo-tree.lua`
- Buffer tabs: `lua/kickstart/plugins/tabs.lua`
- Colorscheme: `lua/kickstart/plugins/colorscheme.lua`
