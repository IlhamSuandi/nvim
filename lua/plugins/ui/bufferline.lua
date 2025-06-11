return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,
  priority = 1000,
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { "any", "any" },
      persist_buffer_sort = true,
      sort_by = "insert_at_end",
    },
  },
  config = function(_, opts)
    vim.opt.termguicolors = true
    require("bufferline").setup(opts)
  end,
}
