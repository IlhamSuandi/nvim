return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        if lib.get_current_view() then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      mode = "n",
      desc = "Toggle Diffview",
    },
  },
}
