return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 100, -- width of the Zen window
			height = 1, -- height of the Zen window
			options = {
				signcolumn = "no",
				number = true,
				relativenumber = true,
				cursorline = true,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
			-- you may turn on/off statusline in zen mode by setting 'laststatus'
			-- statusline will be shown only if 'laststatus' == 3
			laststatus = 0, -- turn off the statusline in zen mode
            alacritty = {
                enabled = true,
                font = "16", -- font size
            },
		},
	},
}
