return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  lazy = false,
  config = function()
    require("nvim-surround").setup {}
  end,
}
