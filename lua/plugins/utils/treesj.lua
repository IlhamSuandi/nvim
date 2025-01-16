return {
  "Wansmer/treesj",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("treesj").setup {}
  end,
}
