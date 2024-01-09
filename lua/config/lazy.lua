local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	"folke/zen-mode.nvim",
	"folke/neodev.nvim",
	"nvim-tree/nvim-web-devicons", -- icons used by nerdfont
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"theprimeagen/harpoon",
	"tpope/vim-fugitive",
	"folke/twilight.nvim", -- spotlight on the function that you are looking at, good on zenmode I guess?
	"terrortylor/nvim-comment",

	{
		"rose-pine/neovim", -- colorscheme of primeagen
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('rose-pine-moon')
		end
	},
	{
		"EdenEast/nightfox.nvim", -- colorscheme <3
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		--	-- carbonfox, dawnfox, terafox, nightfox
		--		vim.cmd.colorscheme('terafox')
		-- 	end
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter", -- better highlighting
		build = ":TSUpdate",
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { -- you can install ripgrep too (apt install ripgrep)
			"nvim-lua/plenary.nvim",
			"sharkdp/fd", -- a opensource version of ´find´
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

require("lazy").setup(plugins, {})
