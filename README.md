# LilSuperUser's Dotfiles
## Nvim Dotfiles
### Keymaps
> _even though keymaps are available and very easy to understand after installing the configuration, here's the keymaps for the lazy (pun intended) crowd_

how a keymap works?
`<space>mf` for example means pressing the leader key i.e. space (default) then press m and then f

---

## Table of Contents

- [General](#general)
- [Clipboard](#clipboard)
- [Tabs](#tabs)
- [Splits](#splits)
- [Snacks](#snacks)
- [Linting](#linting)
- [Mini](#mini)
- [Telescope](#telescope)
- [Harpoon](#harpoon)
- [Git (Fugitive)](#git-fugitive)
- [Git (Gitsigns)](#git-gitsigns)
- [Git (Worktree)](#git-worktree)
- [Trouble](#trouble)
- [Multi-Cursor](#multi-cursor)
- [Color-Picker](#color-picker)
- [LSP Commands](#lsp-commands)
- [Clasp](#clasp)
- [Oil](#oil)
- [Folding (Ufo)](#folding-ufo)
- [Misc](#misc)

---

### General
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Move lines down in visual selection | `J` | v |
| Move lines up in visual selection | `K` | v |
| Join current line with one below | `J` | n |
| Scroll up (cursor centered) | `<C-d>` | n |
| Scroll down (cursor centered) | `<C-u>` | n |
| Next search match (centered) | `n` | n |
| Previous search match (centered) | `N` | n |
| Clear search highlight | `<leader>C` | n |
| Indent selection left (keep selection) | `<` | v |
| Indent selection right (keep selection) | `>` | v |
| Format current buffer with LSP | `<leader>f` | n |
| Format whole file or range (conform) | `<leader>mf` | n/v |
| Replace current word globally | `<leader>r` | n |
| Make current file executable | `<leader>X` | n |
| Execute current file | `<leader>XX` | n |
| Build project in build directory | `<leader>mk` | n |
| Build and run tests | `<leader>rt` | n |
| Copy file path to clipboard | `<leader>fp` | n |
| Toggle LSP diagnostics | `<leader>lx` | n |
| Buffer Local Keymaps (which-key) | `<leader>?` | n |

---

### Clipboard
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Paste without replacing clipboard | `<leader>P` | x |
| Paste without copying selection | `p` | v |
| Delete without yanking | `x` | n |
| Delete to black hole (char) | `<leader>Ds` | n/v |
| Delete to black hole (line) | `<leader>Dl` | n/v |

---

### Tabs
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Open a new tab | `<leader>to` | n |
| Open current file in new tab | `<leader>tO` | n |
| Close current tab | `<leader>tx` | n |
| Move to next tab | `<leader>tn` | n |
| Move to previous tab | `<leader>tp` | n |

---

### Splits
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Split window vertically | `<leader>sv` | n |
| Split window horizontally | `<leader>sh` | n |
| Make splits equal size | `<leader>se` | n |
| Close current split | `<leader>sx` | n |
| Move to left split | `<C-h>` | n |
| Move to below split | `<C-j>` | n |
| Move to up split | `<C-k>` | n |
| Move to right split | `<C-l>` | n |

---

### Snacks
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| TODO/Fix/FIXME | `<space>pT` | n |
| Look through ToDo comments | `<space>pt` | n |
| Next todo comment | `]t` | n |
| Previous todo comment | `[t` | n |
| Disable Indentated Lines | `<space>ic` | n |
| Enable Indentated Lines | `<space>io` | n |
| Help Pages | `<space>vh` | n |
| Pick & Switch Git Branches | `<space>gbr` | n |
| Pick Color Schemes | `<space>th` | n |
| Search Man Pages | `<space>pm` | n |
| Search Registers | `<space>p'` | n |
| Search Keymaps | `<space>pk` | n |
| Grep a visual selection | `<space>pvs` | v |
| Grep Something | `<space>pw` | n |
| Find nvim config files | `<space>pc` | n |
| Find Files | `<space>pf` | n |
| Close Buffer | `<space>dB` | n |
| Fast Rename Current File | `<space>R` | n |
| Git diff (hunks) | `<space>gd` | n |
| Lazygit Logs | `<space>gl` | n |
| Lazygit | `<space>lg` | n |

---

### Linting
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Trigger linting for current file | `<space>l` | n |

---

### Mini (Files/Comment/Trailspace)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Open MiniFiles explorer | `<leader>e` | n |
| Open MiniFiles at current file | `<leader>E` | n |
| Toggle hidden files | `<leader>H` | n |
| Trim trailing whitespace | `<leader>ts` | n |
| Clear trailing whitespace highlight | `<leader>tc` | n |

---

### Telescope
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Fuzzy find recent files | `<leader>pr` | n |
| Fuzzy find notifications | `<leader>pn` | n |
| Find word under cursor | `<leader>pWs` | n |
| Switch themes | `<leader>ths` | n |

---

### Harpoon
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Add file to harpoon | `<leader>ha` | n |
| Toggle harpoon quick menu | `<leader>hl` | n |
| Jump to file 1 | `<leader>1` | n |
| Jump to file 2 | `<leader>2` | n |
| Jump to file 3 | `<leader>3` | n |
| Jump to file 4 | `<leader>4` | n |
| Remove file 1 | `<leader>d1` | n |
| Remove file 2 | `<leader>d2` | n |
| Remove file 3 | `<leader>d3` | n |
| Remove file 4 | `<leader>d4` | n |

---

### Git (Fugitive)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Open Git status | `<leader>gg` | n |
| Git push (fugitive buffer) | `P` | n |
| Git pull with rebase (fugitive buffer) | `p` | n |
| Set upstream (fugitive buffer) | `t` | n |

---

### Git (Gitsigns)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Next hunk | `]h` | n |
| Previous hunk | `[h` | n |
| Stage hunk | `<leader>gs` | n/v |
| Reset hunk | `<leader>gr` | n/v |
| Stage buffer | `<leader>gS` | n |
| Reset buffer | `<leader>gR` | n |
| Undo stage hunk | `<leader>gu` | n |
| Preview hunk | `<leader>gp` | n |
| Toggle line blame | `<leader>gB` | n |
| Diff this | `<leader>gd` | n |
| Diff this ~ | `<leader>gD` | n |
| Select hunk | `ih` | o/x |

---

### Git (Worktree)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| List git worktrees | `<leader>gwt` | n |
| Create git worktree | `<leader>gwc` | n |

---

### Trouble
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Workspace diagnostics | `<leader>xw` | n |
| Document diagnostics | `<leader>xd` | n |
| Symbols/todos | `<leader>xt` | n |
| Location list | `<leader>xl` | n |
| Quickfix list | `<leader>xq` | n |

---

### Multi-Cursor
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Line Skip Cursor (+1) | `<space>j` | n |
| Line Skip Cursor (-1) | `<space>k` | n |

---

### Color-Picker
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Toggle color highlighter | `<leader>cc` | n |

---

### LSP Commands
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Show LSP info | `:LspInfo` | n |
| Stop LSP clients | `:LspStop` | n |
| Start LSP | `:LspStart` | n |
| Restart LSP | `:LspRestart` | n |
| Show LSP references | `gR` | n |
| Go to declaration | `gD` | n |
| Show LSP definitions | `gd` | n |
| Show LSP implementations | `gi` | n |
| Show LSP type definitions | `gt` | n |
| Code actions | `<leader>vca` | n/v |
| Smart rename | `<leader>rn` | n |
| Show buffer diagnostics | `<leader>D` | n |
| Show line diagnostics | `<leader>d` | n |
| Show documentation (hover) | `K` | n |
| Restart LSP (buffer) | `<leader>rs` | n |
| Signature help (insert mode) | `<C-h>` | i |

---

### Clasp (Auto-pairing)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Wrap next (forward) | `<C-;>` | n/i |
| Wrap previous (backward) | `<C-'>` | n/i |
| Undo in insert mode | `<C-u>` | i |

---

### Oil (File Explorer)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Open parent directory | `-` | n |
| Open parent directory (floating) | `<leader>-` | n |
| Toggle hidden files | `g.` | n |
| Show help | `g?` | n |
| Refresh | `<C-r>` | n |
| Close | `q` | n |

---

### Folding (Ufo)
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Open all folds | `zR` | n |
| Close all folds | `zM` | n |
| Fold / Unfold at cursor | `za` | n |

---

### Misc
| Function | Keymap | Mode |
| -------------- | --------------- | ----- |
| Wrap with abbreviation | `<leader>xe` | n/v |
| Clear notifications | `<leader>cn` | n |
| Toggle undo-tree | `<leader>u` | n |
