return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  opts = {
    hooks = {
      diff_buf_read = function(bufnr)
        -- Change local options in diff buffers
        vim.opt_local.wrap = true
        vim.opt_local.list = false
        vim.opt_local.colorcolumn = { 80 }
      end,
    },
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    }
  },
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        if lib.get_current_view() then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
          vim.defer_fn(function()
            vim.cmd("DiffviewToggleFiles")
          end, 100) -- wait 100ms to ensure panel is created
        end
      end,
      mode = "n",
      desc = "Toggle Diffview (no file panel)",
    },
  },
}
