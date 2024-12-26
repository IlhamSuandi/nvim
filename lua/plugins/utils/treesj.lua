return {
  "Wansmer/treesj",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("treesj").setup {}
  end,
}
