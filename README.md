# LilSuperUser's Dotfiles
## Nvim Dotfiles
### Keymaps
> _even though keymaps are available and very easy to understand after installing the configuration, here's the keymaps for the lazy (pun intended) crowd_

how a keymap works?
`<space>mf` for example means pressing the leader key i.e. space (default) then press m and then f

---

### General
| Function | Keymap |
| -------------- | --------------- |
| Move lines down in visual selection | `J` |
| Move lines up in visual selection | `K` |
| Join current line with one below | `J` |
| Scroll up (cursor centered) | `<C-d>` |
| Scroll down (cursor centered) | `<C-u>` |
| Next search match (centered) | `n` |
| Previous search match (centered) | `N` |
| Clear search highlight | `<leader>C` |
| Indent selection left (keep selection) | `<` |
| Indent selection right (keep selection) | `>` |
| Format current buffer with LSP | `<leader>f` |
| Replace current word globally | `<leader>r` |
| Make current file executable | `<leader>X` |
| Execute current file | `<leader>XX` |
| Build project in build directory | `<leader>mk` |
| Build and run tests | `<leader>rt` |
| Copy file path to clipboard | `<leader>fp` |
| Toggle LSP diagnostics | `<leader>lx` |
| Buffer Local Keymaps (which-key) | `<leader>?` |

---

### Clipboard
| Function | Keymap |
| -------------- | --------------- |
| Paste without replacing clipboard | `<leader>P` (visual) |
| Paste without copying selection | `p` (visual) |
| Delete without yanking | `x` |
| Delete to black hole (char) | `<leader>Ds` |
| Delete to black hole (line) | `<leader>Dl` |

---

### Tabs
| Function | Keymap |
| -------------- | --------------- |
| Open a new tab | `<leader>to` |
| Open current file in new tab | `<leader>tO` |
| Close current tab | `<leader>tx` |
| Move to next tab | `<leader>tn` |
| Move to previous tab | `<leader>tp` |

---

### Splits
| Function | Keymap |
| -------------- | --------------- |
| Split window vertically | `<leader>sv` |
| Split window horizontally | `<leader>sh` |
| Make splits equal size | `<leader>se` |
| Close current split | `<leader>sx` |
| Move to left split | `<C-h>` |
| Move to below split | `<C-j>` |
| Move to up split | `<C-k>` |
| Move to right split | `<C-l>` |

---

### Snacks
| Function | Keymap |
| -------------- | --------------- |
| TODO/Fix/FIXME | `<space>pT` |
| Look through ToDo comments | `<space>pt` |
| Disable Indentated Lines | `<space>ic` |
| Enable Indentated Lines | `<space>io` |
| Help Pages | `<space>vh` |
| Pick & Switch Git Branches | `<space>gbr` |
| Pick Color Schemes | `<space>th` |
| Search Man Pages | `<space>pm` |
| Search Registers | `<space>p'` |
| Search Keymaps | `<space>pk` |
| Grep a visual selection | `<space>pvs` |
| Grep Something | `<space>pw` |
| Find nvim config files | `<space>pc` |
| Find Files | `<space>pf` |
| Close Buffer | `<space>dB` |
| Fast Rename Current File | `<space>R` |
| Git diff (hunks) | `<space>gd` |
| Lazygit Logs | `<space>gl` |
| Lazygit | `<space>lg` |

---

### Linting
| Function | Keymap |
| -------------- | --------------- |
| Trigger linting for current file | `<space>l` |

---

### Mini (Files/Comment/Trailspace)
| Function | Keymap |
| -------------- | --------------- |
| Open MiniFiles explorer | `<leader>e` |
| Open MiniFiles at current file | `<leader>E` |
| Toggle hidden files | `<leader>H` |
| Trim trailing whitespace | `<leader>ts` |
| Clear trailing whitespace highlight | `<leader>tc` |

---

### Telescope
| Function | Keymap |
| -------------- | --------------- |
| Fuzzy find recent files | `<leader>pr` |
| Fuzzy find notifications | `<leader>pn` |
| Find word under cursor | `<leader>pWs` |
| Switch themes | `<leader>ths` |

---

### Harpoon
| Function | Keymap |
| -------------- | --------------- |
| Add file to harpoon | `<leader>ha` |
| Toggle harpoon quick menu | `<leader>hl` |
| Jump to file 1 | `<leader>1` |
| Jump to file 2 | `<leader>2` |
| Jump to file 3 | `<leader>3` |
| Jump to file 4 | `<leader>4` |
| Remove file 1 | `<leader>d1` |
| Remove file 2 | `<leader>d2` |
| Remove file 3 | `<leader>d3` |
| Remove file 4 | `<leader>d4` |

---

### Git (Fugitive)
| Function | Keymap |
| -------------- | --------------- |
| Open Git status | `<leader>gg` |
| Git push (fugitive buffer) | `P` |
| Git pull with rebase (fugitive buffer) | `p` |
| Set upstream (fugitive buffer) | `t` |

---

### Git (Gitsigns)
| Function | Keymap |
| -------------- | --------------- |
| Next hunk | `]h` |
| Previous hunk | `[h` |
| Stage hunk | `<leader>gs` |
| Reset hunk | `<leader>gr` |
| Stage buffer | `<leader>gS` |
| Reset buffer | `<leader>gR` |
| Undo stage hunk | `<leader>gu` |
| Preview hunk | `<leader>gp` |
| Toggle line blame | `<leader>gB` |
| Diff this | `<leader>gd` |
| Diff this ~ | `<leader>gD` |

---

### Git (Worktree)
| Function | Keymap |
| -------------- | --------------- |
| List git worktrees | `<leader>gwt` |
| Create git worktree | `<leader>gwc` |

---

### Trouble
| Function | Keymap |
| -------------- | --------------- |
| Workspace diagnostics | `<leader>xw` |
| Document diagnostics | `<leader>xd` |
| Symbols/todos | `<leader>xt` |
| Location list | `<leader>xl` |
| Quickfix list | `<leader>xq` |

---

### Multi-Cursor
| Function | Keymap |
| -------------- | --------------- |
| Line Skip Cursor (+1) | `<space>j` |
| Line Skip Cursor (-1) | `<space>k` |

---

### Color-Picker
| Function | Keymap |
| -------------- | --------------- |
| Toggle color highlighter | `<leader>cc` |

---

### LSP Commands
| Function | Keymap |
| -------------- | --------------- |
| Show LSP info | `:LspInfo` |
| Stop LSP clients | `:LspStop` |
| Start LSP | `:LspStart` |
| Restart LSP | `:LspRestart` |

---

### Misc
| Function | Keymap |
| -------------- | --------------- |
| Wrap with abbreviation | `<leader>xe` |
| Clear notifications | `<leader>cn` |