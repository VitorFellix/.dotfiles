return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- { "3rd/image.nvim", opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false,
	opts = {
		close_if_last_window = true,
		window = {
			mappings = {
				["A"] = "expand_all_nodes",
				["E"] = "expand_all_subnodes",
				["C"] = "close_all_nodes"
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
		},
	},
}
