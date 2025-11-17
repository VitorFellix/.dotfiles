return {
	"nvim-java/nvim-java",
	dependencies = {
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	ft = { "java" },
	config = function()
		-- Java plugin setup
		vim.lsp.config.java = {
			jdk = {
				auto_install = true,
			},
		}

		-- Configure jdtls manually if you want more settings
		vim.lsp.config.jdtls = {
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "Temurin-21",
								path = "/usr/lib/jvm/temurin-21-jdk",
								default = true,
							},
							{
								name = "Temurin-11",
								path = "/usr/lib/jvm/temurin-11-jdk",
							},
							{
								name = "Temurin-8",
								path = "/usr/lib/jvm/temurin-8-jdk",
							},
						},
					},
				},
			},
		}
	end,
}
