return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"jdtls",
				"html",
				"dockerls",
				"docker_compose_language_service",
			},
		},
	},

	-- {
	-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	dependencies = { "williamboman/mason.nvim" },
	-- 	config = function()
	-- 		require("mason-tool-installer").setup({
	-- 			auto_update = true,
	-- 			ensure_installed = {
	-- 				"stylua",
	-- 				"gopls",
	-- 				"goimports",
	-- 				"shfmt",
	-- 				"typescript-language-server",
	-- 				"html-lsp",
	-- 				"css-lsp",
	-- 				"json-lsp",
	-- 				"lua-language-server",
	-- 				"bash-language-server",
	-- 				"dockerfile-language-server",
	-- 				"lemminx",
	-- 				"grammarly-languageserver",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}