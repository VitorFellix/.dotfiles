-- if needed read the help menu with -> :h <option>
vim.opt.mouse = ""

vim.opt.number = false
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 12
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.inccommand = "split"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.laststatus = 3

vim.cmd("syntax on")
vim.cmd("colorscheme kanagawa-wave")

vim.opt.title = true
vim.opt.titlestring = "%t"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
