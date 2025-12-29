return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			icons = {
				rules = false,
				breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
				separator = "󱦰  ", -- symbol used between a key and it's label
				group = "󰹍 ", -- symbol prepended to a group
			},
			win = {
				height = {
					max = math.huge,
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer local keymaps",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				{ "<leader>f", group = "󰍉 Search" },
				{ "<leader>w", group = " Window" },
				{ "<leader>g", group = "󰊢 Git" },
				{ "<leader>S", group = "󱂬 Session" },
				{ "<leader>u", group = "󰄼 Toggles" },
				{ "sa", desc = "Add Surrounding" },
				{ "sd", desc = "Delete Surrounding" },
				{ "sr", desc = "Replace Surrounding" },
				{ "sf", desc = "Find Surrounding (Right)" },
				{ "sF", desc = "Find Surrounding (Left)" },
				{ "sh", desc = "Highlight Surrounding" },
				{ "sn", desc = "Surround n_lines" },
			})
		end,
	},
}
