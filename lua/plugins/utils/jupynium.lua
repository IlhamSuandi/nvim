return {
  "kiyoon/jupynium.nvim",
  build = "pip3 install --user .",
  lazy = false,
  keys = {
    { "<leader>ja", "<cmd>JupyniumStartAndAttachToServer<cr>", desc = "Jupynium Start And Attach" },
    { "<leader>js", "<cmd>JupyniumStartSync<cr>", desc = "Jupynium Start" },
    { "<leader>jq", "<cmd>JupyniumStopSync<cr>", desc = "Jupynium Stop" },
    { "<leader>jc", "<cmd>JupyniumClearSelectedCellsOutputs<cr>", desc = "Jupynium Clear Cells", mode = { "n", "x" } },
    { "<leader>jx", "<cmd>JupyniumKernelInterrupt<cr>", desc = "Jupynium Interupt", mode = { "n", "x" } },
    { "<leader>j<cr>", "<cmd>JupyniumExecuteSelectedCells<cr>", desc = "Jupynium Execute Cells", mode = { "n", "x" } },
    { "<leader>jh", "<cmd>JupyniumKernelHover<cr>", desc = "Jupynium Kernel Hover" },
    { "<leader>jr", "<cmd>JupyniumKernelRestart<cr>", desc = "Jupynium Kernel Restart" },
    { "<leader>jd", "<cmd>JupyniumShortsightedToggle<cr>", desc = "Jupynium Dimming" },
    {
      "<leader>jn",
      "<cmd>lua require'jupynium.textobj'.goto_next_cell_separator()<cr>",
      desc = "Go to next Jupynium cell",
      mode = { "n", "x", "o" },
    },
    {
      "<leader>jp",
      "<cmd>lua require'jupynium.textobj'.goto_previous_cell_separator()<cr>",
      desc = "Go to next Jupynium cell",
      mode = { "n", "x", "o" },
    },
  },
  config = function()
    require("jupynium").setup {
      use_default_keybindings = false,
      auto_download_ipynb = false,
    }
    vim.cmd [[
      hi! link JupyniumCodeCellSeparator CursorLine
      hi! link JupyniumMarkdownCellSeparator MatchParen 
      hi! link JupyniumMarkdownCellContent MatchParen
      hi! link JupyniumMagicCommand Keyword
    ]]
  end,
}
