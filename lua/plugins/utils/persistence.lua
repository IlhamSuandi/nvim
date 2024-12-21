-- session things
return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  config = function()
    require("persistence").setup {
      dir = vim.fn.stdpath "state" .. "/sessions/",
      need = 1,
      branch = true,
    }
  end,
}
