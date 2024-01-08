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
		"EdenEast/nightfox.nvim", 
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
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},{ 
		"nvim-telescope/telescope.nvim",
	},{
		"folke/zen-mode.nvim",
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
		"folke/twilight.nvim",
	}
}

require("lazy").setup(plugins, {})
