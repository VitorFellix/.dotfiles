return {
	{ 'rose-pine/neovim',                 name = 'rose-pine' },
	{ 'folke/tokyonight.nvim',            name = 'tokyonight' },
	{ 'rebelot/kanagawa.nvim',            name = 'kanagawa' },
	{ 'aktersnurra/no-clown-fiesta.nvim', name = 'no-clown' },
	{
		'EdenEast/nightfox.nvim',
		name = 'night-fox',
		config = function()
			vim.cmd("colorscheme terafox")
		end,
	},
	{ 'catppuccin/nvim', name = 'catppuccin', },

}
