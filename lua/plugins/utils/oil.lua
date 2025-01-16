return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    cleanup_delay_ms = 100,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  setup = function(_, opts)
    require("oil").setup(opts)
  end,
}
