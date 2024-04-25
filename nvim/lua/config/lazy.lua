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
	'nvim-tree/nvim-web-devicons', -- icons used by nerdfont
	'theprimeagen/harpoon',
	'tpope/vim-fugitive',
	'folke/twilight.nvim', -- spotlight on the function that you are looking at, good on zenmode I guess?
	'terrortylor/nvim-comment', -- this one works
	-- 'numToStr/Comment.nvim', -- this one was on kickstart
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

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
		{ 'catppuccin/nvim', name = 'catppuccin', },
	},

	{
		'folke/which-key.nvim',
		event = 'VimEnter',
	},

	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'go', 'css', 'javascript', 'scala' },
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = { enable = true, disable = { 'ruby' } },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require('nvim-treesitter.install').prefer_git = true
			-- @diagnostic disable-next-line: missing-fields
			require('nvim-treesitter.configs').setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	{ -- Collection of various small independent plugins/modules
		'echasnovski/mini.nvim',
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require('mini.ai').setup { n_lines = 500 }

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require('mini.surround').setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require 'mini.statusline'
			-- set use_icons to true if you have a Nerd Font
			statusline.setup { use_icons = vim.g.have_nerd_font }

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return '%2l:%-2v'
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { -- you can install ripgrep too (apt install ripgrep)
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable('make') == 1
				end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{
				'nvim-tree/nvim-web-devicons',
				enabled = vim.g.have_nerd_font
			},
			'sharkdp/fd', -- a opensource version of ´find´
		},
	},

	-- LSP Support
	--	{
	--		'VonHeikemen/lsp-zero.nvim',
	--			branch = 'v3.x',
	--			lazy = true,
	--			config = false,
	--	},

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'hrsh7th/cmp-nvim-lsp',
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			{ 'j-hui/fidget.nvim',       opts = {} }, -- lil messages on the bottom when lsp loads something
			{ 'folke/neodev.nvim',       opts = {} },

		}
	},

	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
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
