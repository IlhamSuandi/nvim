return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require "grug-far"
        local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
        grug.open {
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        }
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
  config = function()
    require("grug-far").setup {
      keymaps = {
        replace = { n = "<leader>r" },
        qflist = { n = "<leader>q" },
        syncLocations = { n = "<leader>s" },
        syncLine = { n = "<leader>l" },
        close = { n = "<leader>c" },
        historyOpen = { n = "<leader>t" },
        historyAdd = { n = "<leader>a" },
        refresh = { n = "<leader>f" },
        openLocation = { n = "<leader>o" },
        openNextLocation = { n = "<down>" },
        openPrevLocation = { n = "<up>" },
        gotoLocation = { n = "<enter>" },
        pickHistoryEntry = { n = "<enter>" },
        abort = { n = "<leader>b" },
        help = { n = "g?" },
        toggleShowCommand = { n = "<leader>p" },
        swapEngine = { n = "<leader>e" },
        previewLocation = { n = "<leader>i" },
        swapReplacementInterpreter = { n = "<leader>x" },
        applyNext = { n = "<leader>j" },
        applyPrev = { n = "<leader>k" },
      },
    }
  end,
}
