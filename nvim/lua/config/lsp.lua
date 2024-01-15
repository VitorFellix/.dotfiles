local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
	},
})

local lua_opts = lsp_zero.nvim_lua_ls()

require('lspconfig').lua_ls.setup(lua_opts)
