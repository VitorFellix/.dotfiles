return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LSP setup
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

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
		{ "folke/neodev.nvim", opts = {} },

		-- Formatting/Linting
		"nvimtools/none-ls.nvim", -- null-ls successor
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Java setup
		require("java").setup({
			spring_boot_tools = {
				enabled = true,
			},
		})

		require("fidget").setup({})
		require("mason").setup({})
		-- used for lsp, linter and formatters
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", "stylua", "gopls", "goimports", "shfmt", "typescript-language-server", "html-lsp",
				"css-lsp", "json-lsp", "lua-language-server", "bash-language-server", "gopls",
				"dockerfile-language-server", "lemminx", "grammarly-languageserver",
			},
			auto_update = true,
		})
		-- used for configuring lsp
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"jsonls",
				"bashls",
				"gopls",
				"html",
				"cssls",
				"dockerls",
				"lemminx",
				"grammarly",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		-- Completion setup
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
		})

		-- Formatter / Linter Setup
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Web: HTML, CSS, JS, TS, JSON
				null_ls.builtins.formatting.prettier,

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
