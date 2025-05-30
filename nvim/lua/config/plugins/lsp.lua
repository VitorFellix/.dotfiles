return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Java support
		"nvim-java/nvim-java",
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-refactor",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",

		-- Completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Extra utilities
		"mfussenegger/nvim-dap",
		"j-hui/fidget.nvim",
		"MunifTanjim/nui.nvim",
		"windwp/nvim-autopairs",

		-- Formatting/Linting
		"nvimtools/none-ls.nvim", -- null-ls successor
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-l>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Autopairs setup
		require("nvim-autopairs").setup({
			check_ts = true, -- Enable treesitter integration
		})
		cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

		require("fidget").setup({})

		-- Diagnostic visuals
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				source = true,
				focusable = false,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
			update_in_insert = false,
		})

		-- Formatter / Linter Setup
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Web: HTML, CSS, JS, TS, JSON
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css", "javascript", "typescript", "json", "yaml", "markdown" },
				}),

				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Go
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,

				-- Bash
				null_ls.builtins.formatting.shfmt,
			},
		})

	end,
}
