# Neovim Configuration Guide

## File Exploration

### Oil.nvim (Edit the File System)
`oil.nvim` allows you to edit your file system like a normal buffer.

- **Open Oil**: `<leader>e`
- **Go Up**: `-` (dash)
- **Open File**: `<CR>` (Enter)
- **Open VSplit**: `<C-s>`
- **Preview**: `<C-p>`
- **Refactoring**: You can rename, move, or delete files by editing the text in the Oil buffer and saving the file (`:w`).

### Search & Navigation (`<leader>f`)
We use `snacks.picker` for lightning-fast searching.

- **Search Files**: `<leader>ff`
- **Global Grep**: `<leader>fg`
- **Search Buffer Lines**: `<leader>fl`
- **Search Word under cursor**: `<leader>fw`
- **Recent Files**: `<leader>fr`
- **Git Files**: `<leader>fG`
- **LSP Symbols**: `<leader>fs`
- **Project Replace**: `<leader>fR` (Grug-far)

#### Handling Previews in Snacks
When the picker is open:
- **Scroll Preview**: `<C-f>` (down), `<C-b>` (up)
- **Toggle Preview**: `<M-p>` (Alt+p)

---

### Surround (`mini.surround`)
Wrap text objects with brackets, quotes, etc.

- **Add**: `sa{motion}{char}` (e.g., `saiw"` surrounds word with quotes)
- **Delete**: `sd{char}` (e.g., `sd"` deletes surrounding quotes)
- **Replace**: `sr{old}{new}` (e.g., `sr"'` replaces `"` with `'`)
- **Visual**: Select text then `sa{char}`

---

### Harpoon 2 (Quick Navigation)
- **Mark File**: `<leader>ha`
- **Open Menu**: `<leader>he`
- **Quick Jump**: `<leader>h1`, `<leader>h2`, etc.

---

### LSP & Coding
- **Go to Definition**: `gd`
- **Show References**: `gr`
- **Rename**: `<F2>` or `<leader>rn`
- **Format**: `<leader>F`
- **Code Action**: `<leader>ca`
- **Diagnostics**: `<leader>xx` (Trouble list)
- **Fast Jump**: `s` + 2 characters (Flash)

### Sessions (`<leader>S`)
- **Restore Current**: `<leader>Ss`
- **Restore Last**: `<leader>Sl`
- **Stop Saving**: `<leader>Sd`

### Git & Terminal
- **Lazygit**: `<leader>gg`
- **Git Status**: `<leader>gs`
- **Floating Terminal**: `<C-/>`
- **Dismiss Notifications**: `<leader>un`

---

## Tips & Tricks

### Selection
- **Select All**: `<leader>a`
- **Select Inside**: `vi(` or `vi[` or `vi"`

### Window Management (`<leader>w`)
- **Focus**: `<C-h/j/k/l>`
- **Resize**: `<C-n/p/o/b>`
- **Vertical Split**: `<leader>|`
- **Horizontal Split**: `<leader>-`
- **Equal Size**: `<leader>we`
- **Close Split**: `<leader>wx`
