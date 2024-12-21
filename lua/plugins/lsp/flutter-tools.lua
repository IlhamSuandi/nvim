return {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require "config.dap"
    require("flutter-tools").setup {
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
      },
    }
  end,
}
