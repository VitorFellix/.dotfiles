local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	'folke/zen-mode.nvim',
	'folke/neodev.nvim',
	'nvim-tree/nvim-web-devicons', -- icons used by nerdfont
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'theprimeagen/harpoon',
	'tpope/vim-fugitive',
	'folke/twilight.nvim', -- spotlight on the function that you are looking at, good on zenmode I guess?
	'terrortylor/nvim-comment',

	-- colorschemes
	-- { 'rose-pine/neovim', name = 'rose-pine', },
	'rebelot/kanagawa.nvim',
	'aktersnurra/no-clown-fiesta.nvim',
	'EdenEast/nightfox.nvim',
	{ 'catppuccin/nvim',  name = 'catppuccin', },

	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter', -- better highlighting
		build = ':TSUpdate',
	},

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { -- you can install ripgrep too (apt install ripgrep)
			'nvim-lua/plenary.nvim',
			'sharkdp/fd', -- a opensource version of ´find´
		}
	},

	-- LSP Support
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		}
	},
	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' }
		},
	},

}

vim.cmd.colorscheme("habamax")

require('lazy').setup(plugins, {})
