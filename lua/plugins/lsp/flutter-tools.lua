return {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    -- require "configs.dap.flutter"
    require("flutter-tools").setup {
      -- debugger = {
      --   enabled = false,
      --   run_via_dap = true,
      --   exception_breakpoints = {},
      -- },
      lsp = {
        settings = {
          showtodos = true,
          completefunctioncalls = true,
          analysisexcludedfolders = {
            vim.fn.expand "$Home/.pub-cache",
          },
          renamefileswithclasses = "prompt",
          updateimportsonrename = true,
          enablesnippets = true,
        },
      },
    }
  end,
}
