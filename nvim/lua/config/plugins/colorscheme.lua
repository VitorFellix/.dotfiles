return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end
	},
	{ 'folke/tokyonight.nvim',            name = 'tokyonight' },
	{ 'rebelot/kanagawa.nvim',            name = 'kanagawa' },
	{ 'aktersnurra/no-clown-fiesta.nvim', name = 'no-clown' },
	{ 'EdenEast/nightfox.nvim',           name = 'night-fox' },
	{ 'catppuccin/nvim',                  name = 'catppuccin', },
}
