-- Set leader key
vim.g.mapleader = " "
vim.g.have_nerd_font = true

-- Basic keymaps
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex, { desc = "Open nvim Explorer (aka :Ex)" })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format file" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight search" })

-- Quick escape from insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Exit insert mode" })

-- Disable arrow keys in normal mode to encourage hjkl usage
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tab management
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- Better text editing
vim.keymap.set('n', '<leader>a', 'gg<S-v>G', { desc = 'Select all text' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and maintain cursor position' })

-- Better scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

-- Line movement
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- Better paste (preserve clipboard)
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking replaced text' })

-- Copy to system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]], { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copy line to system clipboard' })

-- Delete without yanking
vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]], { desc = 'Delete without yanking' })

-- Quick save and quit
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Save all files' })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<CR>', { desc = 'Quit all' })

-- Buffer navigation
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete current buffer' })

-- Quickfix navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item' })

-- Reload configuration command
vim.api.nvim_create_user_command("ReloadConfig", function()
  vim.cmd("source " .. vim.env.MYVIMRC)
  vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload Neovim configuration" })

-- Reload keymap shortcut
vim.keymap.set('n', '<leader>R', '<cmd>ReloadConfig<CR>', { desc = 'Reload Neovim config' })
