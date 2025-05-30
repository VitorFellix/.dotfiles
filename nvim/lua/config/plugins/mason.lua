return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tsserver",
					"rust_analyzer",
					-- Add other servers you want auto-installed
				},
				automatic_installation = true,
			})
			require("mason-tool-installer").setup({
				auto_update = true,
				ensure_installed = {
					"jdtls",
					"prettier",
					"stylua",
					"gopls",
					"goimports",
					"shfmt",
					"typescript-language-server",
					"html-lsp",
					"css-lsp",
					"json-lsp",
					"lua-language-server",
					"bash-language-server",
					"dockerfile-language-server",
					"lemminx",
					"grammarly-languageserver",
				},
			})
		end,
	},
}
