-- inline diagnostic
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  lazy = false,
  config = function()
    require("tiny-inline-diagnostic").setup {}
  end,
}
