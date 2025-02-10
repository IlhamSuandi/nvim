-- NOTE : pretify lsp things
return {
  "nvimdev/lspsaga.nvim",
  lazy = false,
  opts = {
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
      show_file = false,
      hide_keyword = true,
    },
    outline = {
      keys = {
        toggle_or_jump = "<CR>",
      },
      win_width = 50,
    },
  },
  config = function(_, opts)
    vim.diagnostic.config {
      severity_sort = true,
    }
    require("lspsaga").setup(opts)
  end,
}
