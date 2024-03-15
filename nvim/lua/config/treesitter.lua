require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "java", "scala", "go", "css" },
	indent = { enable = true },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
}
