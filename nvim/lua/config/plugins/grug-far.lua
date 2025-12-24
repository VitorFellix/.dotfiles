return {
  'MagicDuck/grug-far.nvim',
  opts = { headerMaxWidth = 80 },
  keys = {
    {
      "<leader>sr",
      function()
        require('grug-far').open({ transient = true })
      end,
      mode = { "n", "v" },
      desc = "Search and replace (Grug-far)",
    },
  },
}
