return {
	'folke/zen-mode.nvim',
	config = function()
		require 'zen-mode'.toggle({
			opts = {
				window = {
					backdrop = 1, -- defines the color of the background, makes it blacker, 1 is default color
					options = {
						number = true,
						relativenumber = true,
						signcolumn = 'yes',
					}
				},
			},
			-- TODO: create a config to run ZenMode everytime I enter a file and to exit everytime I exit a file
		})
	end
}
