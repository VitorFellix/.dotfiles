-- if needed read the help menu with -> :h <option>
vim.opt.mouse = "nv"

vim.cmd("syntax off")
vim.cmd("colorscheme default")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.expandtab = true

vim.opt.signcolumn = "no"
vim.opt.scrolloff = 8
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

vim.opt.ruler = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.updatetime = 100
vim.opt.laststatus = 3

vim.opt.title = true
vim.opt.titlestring = "%t"

vim.opt.winborder = "bold"
vim.opt.cursorlineopt = "both"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.winborder="bold"
