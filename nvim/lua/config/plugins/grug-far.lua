return {
  'MagicDuck/grug-far.nvim',
  opts = { headerMaxWidth = 80 },
  keys = {
    {
      "<leader>fR",
      function()
        require('grug-far').open({ transient = true })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Grug-far)",
    },
  },
}
