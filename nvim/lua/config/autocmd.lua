-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Reload configuration command
vim.api.nvim_create_user_command("ReloadConfig", function()
	-- Get config path with fallback
	local config_file = vim.env.MYVIMRC or vim.fn.stdpath("config") .. "/init.lua"

	-- Clear command line
	vim.cmd("echo ''")

	-- Reload
	vim.cmd("source " .. config_file)

	-- Optional: notify success
	print("✓ Neovim config reloaded!")
end, {
	desc = "Reload Neovim configuration", -- Help description
	force = true, -- Override if command already exists
})
