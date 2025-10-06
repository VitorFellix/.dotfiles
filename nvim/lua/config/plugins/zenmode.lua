return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 120, -- width of the Zen window
			height = 0.7, -- height of the Zen window
			options = {
				signcolumn = "no",
				number = true,
				relativenumber = false,
				cursorline = true,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
		},
	},
}
