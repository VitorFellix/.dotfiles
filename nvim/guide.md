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

- **Search Files**: `<leader>ff`
- **Global Search (Grep)**: `<leader>/`
- **Go to Definition**: `gd`
- **Show References**: `gr`
- **Floating Terminal**: `<C-/>`
- **Lazygit**: `<leader>gg`
- **Dismiss Notifications**: `<leader>un`

#### Handling Previews in Snacks
When the picker is open (like in `<leader>ff` or `gd`):
- **Scroll Preview**: Use `<C-f>` to scroll down and `<C-b>` to scroll up in the preview window.
- **Toggle Preview**: Use `<M-p>` (Alt+p) to hide/show the preview window if it's in the way.

---

### Surround (Wrapping Text)
We use `mini.surround` to handle quotes, brackets, and tags.

- **Add Surround**: `saiw)` -> **s**urround **a**dd **i**nner **w**ord **)**
- **Delete Surround**: `sd'` -> **s**urround **d**elete **'**
- **Replace Surround**: `sr)'` -> **s**urround **r**eplace **)** with **'**

---

### Harpoon 2 (Quick Navigation)
Use Harpoon to "mark" files you are currently working on.

- **Mark File**: `<leader>ha`
- **Open Menu**: `<leader>he`
- **Quick Jump**: `<leader>h1`, `<leader>h2`, etc.

---

### LSP & Coding
- **Diagnostics List**: `<leader>xx` (Toggle Trouble list)
- **Format**: `<leader>F` (Powered by `conform.nvim` with auto-format on save)
- **Search & Replace**: `<leader>sr` (Powered by `grug-far.nvim`)
- **Fast Jump**: Press `s` followed by 2 characters (Powered by `flash.nvim`)

### Sessions & Workflow
- **Restore Session**: `<leader>qs` (Restores the session for the current directory)
- **Last Session**: `<leader>ql` (Restores the last session regardless of directory)
- **Markdown**: Your markdown files are now rendered with `render-markdown.nvim`.
- **Code Action**: `<leader>ca`
- **Format**: `<leader>F`

---

## Tips & Tricks

### Selection
- **Select Inside**: `vi(` or `vi[` or `vi"` to select everything inside the brackets/quotes.
- **Select All**: `<leader>a`

### Window Management
- **Focus**: `<C-h/j/k/l>` to move between splits.
- **Resize**: `<C-n/p/o/b>` to grow/shrink windows.
- **Splits**: `<leader>sv` (vertical) and `<leader>sh` (horizontal).

## Completed To-dos
- [x] Easy way of putting ({['""']}) around a word (Use `saiw`)
- [x] Easy way selecting inside a ({[]}) (Use `vi[`)
- [x] A way to see the entire name of a file (Snacks picker handles this)
- [x] How to move the preview in snacks (Use `<C-f>` and `<C-b>`)