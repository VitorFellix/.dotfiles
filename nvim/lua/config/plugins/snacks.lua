return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Search buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep text" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command history" },
    -- Find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Search buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Search files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Search git files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Search recent files" },
    -- Git
    { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Search in current buffer" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Search current word" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Search by grep" },
    -- Search
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Search diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Search help" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Search keymaps" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Search quickfix" },
    { "<leader>su", function() Snacks.picker.resume() end, desc = "Search resume" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "LSP: Go to definition" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "LSP: References" },
    { "gi", function() Snacks.picker.lsp_implementations() end, desc = "LSP: Go to implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "LSP: Go to type definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP: Symbols" },

    -- Existing Snacks utilities
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle scratch buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select scratch buffer" },
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification history" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename file" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git: Browse repository" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git: Blame line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Git: File log (lazygit)" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Git: Open lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Git: Log (lazygit)" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss all notifications" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle terminal" },
    { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Previous reference", mode = { "n", "t" } },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (optional)
        _G.Snacks = require("snacks")

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}