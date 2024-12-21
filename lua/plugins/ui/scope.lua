-- tab things
return {
  "tiagovla/scope.nvim",
  lazy = false,
  event = "VimEnter",
  config = function()
    vim.opt.sessionoptions = { -- required
      "buffers",
      "tabpages",
      "globals",
    }
    require("scope").setup()
  end,
}
