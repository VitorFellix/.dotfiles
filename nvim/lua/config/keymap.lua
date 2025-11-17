-- Basic keymaps
-- Clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight search" })
-- Explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open nvim Explorer (aka :Ex)" })
vim.keymap.set("n", "<leader>E", ":Neotree filesystem reveal float<CR>", { desc = "Open Neotree on float mode" })

-- Format
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format file" })

-- Disable arrow keys in normal mode to encourage hjkl usage
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!"<CR>')

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>m", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>M", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Buffer resizing
vim.keymap.set("n", "<C-n>", "<C-w>10>", { desc = "Move buffer 10x to right"})
vim.keymap.set("n", "<C-p>", "<C-w>10<", { desc = "Move buffer 10x to left"})
vim.keymap.set("n", "<C-o>", "<C-w>5+", { desc = "Move buffer 5x up"})
vim.keymap.set("n", "<C-b>", "<C-w>5-", { desc = "Move buffer 5x down"})

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })

-- Better text editing
vim.keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select all text" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and maintain cursor position" })

-- Better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Better paste (preserve clipboard)
-- vim.keymap.set("x", "p", [["_dp]], { desc = "Paste after without yanking replaced text" })
-- vim.keymap.set("x", "P", [["_dp]], { desc = "Paste before without yanking replaced text" })

-- Copy to system clipboard
-- vim.keymap.set({ "n", "v" }, "y", [["+y]], { desc = "Copy to system clipboard" })
-- vim.keymap.set("n", "Y", [["+Y]], { desc = "Copy line to system clipboard" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Quick save and quit
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", { desc = "Save all files" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })

-- Reload keymap shortcut
vim.keymap.set("n", "<leader>rs", ":source $MYVIMRC<CR>", { desc = "Source config" })
vim.keymap.set("n", "<leader>rp", function()
	local plugins = require("lazy").plugins()
	local plugin_names = {}
	for _, plugin in ipairs(plugins) do
		table.insert(plugin_names, plugin.name)
	end

	vim.ui.select(plugin_names, {
		title = "Reload plugin",
	}, function(selected)
		require("lazy").reload({ plugins = { selected } })
	end)
end, { desc = "Reload plugin" })
vim.keymap.set("n", "<leader>ru", ":update<CR> :source<CR>", { desc = "Update and Source file" })

vim.keymap.set("n", "<leader>l0", ":set laststatus=0<CR>", { desc = "Set laststatus to 0" })
vim.keymap.set("n", "<leader>l3", ":set laststatus=3<CR>", { desc = "Set laststatus to 3" })
