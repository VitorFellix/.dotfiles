return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = {
				"lua_ls",
				"vimls",
			}
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
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
