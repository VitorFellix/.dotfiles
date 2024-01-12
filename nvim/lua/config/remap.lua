vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex, { desc = "open nvim Explorer (aka :Ex)" })

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "formats file" })
