# Ele

A Neovim config for frontend and Shopify engineers.

Ele is built around one idea: **Neovim edits, AI tools chat.** Claude Code and OpenCode run in dedicated terminal splits; Copilot handles inline completions; Neovim stays fast, minimal, and auditable.

## Stack

- **Languages:** TypeScript, JavaScript, React, Liquid, Tailwind, GraphQL, JSON, YAML, CSS, SCSS, Markdown
- **Frameworks:** Shopify themes, Hydrogen, Remix
- **AI:** Copilot inline suggestions, Claude Code / OpenCode in splits
- **Core plugins:** Telescope, Treesitter, lspconfig + Mason, conform, blink.cmp, gitsigns, neo-tree, toggleterm

No dashboard. No chat panel. No plugin-of-the-week. Every plugin earns its seat.

## Requirements

- Neovim 0.11+
- A Nerd Font
- ripgrep, node, git
- Shopify CLI (optional, for Shopify commands)

## Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/YOUR_USERNAME/neovim ~/.config/nvim
nvim
```

On first launch, lazy.nvim installs plugins and Mason installs LSP servers and formatters. Run `:Copilot auth` to sign in.

## Layout

```
init.lua                        loader
lua/ele/core/                   options, keymaps, autocmds, lazy bootstrap
lua/ele/plugins/
  editor.lua                    colorscheme, neo-tree, which-key, mini, treesitter
  lsp.lua                       LSP + mason + blink.cmp
  formatting.lua                conform
  git.lua                       gitsigns
  search.lua                    telescope
  terminal.lua                  toggleterm + Claude / OpenCode / dev splits
  ai.lua                        copilot (inline only)
  shopify.lua                   liquid filetype + theme CLI commands
```

## LSP servers

Installed via Mason: `vtsls`, `tailwindcss`, `cssls`, `html`, `jsonls`, `yamlls`, `graphql`, `eslint`, `theme_check` (Shopify Liquid), `lua_ls`.

## Keymaps

Leader is `<Space>`.

### Navigation

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader><leader>` | Switch buffers |
| `<C-h/j/k/l>` | Move between windows |

### Search

| Key | Action |
|-----|--------|
| `<leader>sf` | Files |
| `<leader>sg` | Grep project |
| `<leader>sw` | Grep word under cursor |
| `<leader>s/` | Grep open buffers |
| `<leader>/` | Fuzzy find in current buffer |
| `<leader>s.` | Recent files |
| `<leader>sd` | Diagnostics |
| `<leader>sh` | Help |
| `<leader>sr` | Resume last search |
| `<leader>sn` | Neovim config files |

### LSP

| Key | Action |
|-----|--------|
| `grd` / `gri` / `grt` | Definition / implementation / type definition |
| `grr` | References |
| `grn` | Rename |
| `gra` | Code action |
| `gO` / `gW` | Document / workspace symbols |
| `<leader>th` | Toggle inlay hints |

### Format

| Key | Action |
|-----|--------|
| `<leader>cf` | Format buffer (also runs on save) |

### Git

| Key | Action |
|-----|--------|
| `]c` / `[c` | Next / previous hunk |
| `<leader>hs` / `<leader>hr` | Stage / reset hunk |
| `<leader>hS` / `<leader>hR` | Stage / reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line (full) |
| `<leader>hd` / `<leader>hD` | Diff against index / last commit |
| `<leader>tb` | Toggle inline blame |
| `<leader>tw` | Toggle word diff |

### Terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |
| `<leader>ta` | Claude Code (dedicated vertical split) |
| `<leader>to` | OpenCode (dedicated vertical split) |
| `<leader>td` | Run project dev command |
| `<Esc><Esc>` | Leave terminal mode |

### Shopify

| Key | Command | Action |
|-----|---------|--------|
| `<leader>Sd` | `:ShopifyDev` | `shopify theme dev` |
| `<leader>Sp` | `:ShopifyPush` | `shopify theme push` |
| `<leader>Sc` | `:ShopifyCheck` | `shopify theme check` |

## Workflow notes

**AI tools.** `<leader>ta` and `<leader>to` open persistent vertical splits — toggle them away and back without losing the session. Use these for chat, refactors, and multi-file changes. Use Copilot for tab-completion within a single edit.

**Dev servers.** `<leader>td` detects your project (`.shopify/theme.toml` → theme dev, `hydrogen.config.*` → hydrogen dev, else `npm run dev`) and runs it in a horizontal split.

**Format on save.** conform.nvim formats on write for all configured filetypes. `<leader>cf` formats manually.

**Completions.** Copilot gives ghost-text (Tab to accept, Alt-] / Alt-[ to cycle). blink.cmp gives a traditional menu from LSP, paths, and LuaSnip snippets from the active LSP.

## Customizing

- Colorscheme: `lua/ele/plugins/editor.lua`
- Add an LSP server: `lua/ele/plugins/lsp.lua` (`servers` table)
- Add a formatter: `lua/ele/plugins/formatting.lua` (`formatters_by_ft`)
- Change a keymap: look in the relevant module; keymaps live next to the plugin that owns them
