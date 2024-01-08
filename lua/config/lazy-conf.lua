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
	{ 
		"EdenEast/nightfox.nvim", -- colorscheme <3
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('terafox')
		end
	},{ 
		"folke/which-key.nvim", 
		lazy = true,
	},{ 
		"folke/neoconf.nvim",
		cmd = "Neoconf" 
	},{ 
		"folke/neodev.nvim",
	},{
		"nvim-treesitter/nvim-treesitter", -- better highlighting
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query",
					"elixir", "heex", "javascript", "html", "java", "scala", "go"},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},{ 
		"nvim-telescope/telescope.nvim",
		dependencies = { -- you can install ripgrep too (apt install ripgrep)
			"nvim-lua/plenary.nvim",
			"sharkdp/fd", -- a opensource version of ´find´
		}
	},{
		"nvim-tree/nvim-web-devicons", -- icons used by nerdfont
	},{
		"folke/zen-mode.nvim", -- zen-mode =_=
		opts = {
			window = {
				backdrop = 1, -- defines the color of the background, makes it blacker, 1 is default color
				options = {
					number = true,
					relativenumber = true,
					signcolumn = "no",
				}
			},
		},
		-- TODO: create a config to run ZenMode everytime I enter a file and to exit everytime I exit a file
	},{
		"folke/twilight.nvim", -- spotlight on the function that you are looking at, good on zenmode I guess?
	},{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},{
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
				{'hrsh7th/cmp-nvim-lsp'},
			}
		},
		-- Autocompletion
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				{'L3MON4D3/LuaSnip'}
			},
		},
	},{
		"theprimeagen/harpoon",
	},{
		"tpope/vim-fugitive"
	}
}

require("lazy").setup(plugins, {})
