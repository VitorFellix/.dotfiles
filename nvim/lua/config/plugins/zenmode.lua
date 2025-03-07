return {
	'folke/zen-mode.nvim',
	config = function()
		require 'zen-mode'.setup({
			opts = {
				window = {
					options = {
						number = true,
						relativenumber = true,
						signcolumn = 'yes',
					}
				},
			},
		})
	end
}
