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

local fn = vim.fn

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
	'j-hui/fidget.nvim', -- lil messages on the bottom when lsp loads something

	-- colorschemes
	{
		{
			'rose-pine/neovim',
			name = 'rose-pine',
			config = function()
				vim.cmd('colorscheme rose-pine')
			end
		},

		-- unused colorschemes
		-- { 'folke/tokyonight.nvim', name = 'tokyonight' },
		-- {'rebelot/kanagawa.nvim', name = 'kanagawa' },
		-- { 'aktersnurra/no-clown-fiesta.nvim', name = 'no-clown' },
		-- {'EdenEast/nightfox.nvim', name = 'night-fox' },
		-- { 'catppuccin/nvim',  name = 'catppuccin', },
	},

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
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" }
		},
		opts = function()
			local cmp = require("cmp")
			local conf = {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				},
				snippet = {
					expand = function(args)
						-- Comes from vsnip
						fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- None of this made sense to me when first looking into this since there
					-- is no vim docs, but you can't have select = true here _unless_ you are
					-- also using the snippet stuff. So keep in mind that if you remove
					-- snippets you need to remove this select
					["<CR>"] = cmp.mapping.confirm({ select = true })
				})
			}
			return conf
		end
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals_config = require("metals").bare_config()
			metals_config.init_options.statusBarProvider = "off" -- sets fidget to show messages
			metals_config.on_attach = function(client, bufnr)
				-- your on_attach function
				-- require('metals').setup_dap() -- debug thingy, not yet using
			end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end
	},

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", 'gomod' },
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	}
}

require('lazy').setup(plugins, {})
