-- if needed read the help menu with -> :h <option>

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 12
vim.opt.colorcolumn = "120"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.inccommand = 'split'

vim.opt.swapfile = false

vim.opt.laststatus = 3             -- Global statusline

vim.cmd("syntax on")
vim.cmd("colorscheme kanagawa-wave")

vim.opt.title = true               -- Enable title updates
vim.opt.titlestring = '%t'
