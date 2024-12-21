return {
  "neovim/nvim-lspconfig",
  lazy = false,
  opts = {
    diagnostics = {
      virtual_text = false,
    },
  },
  config = function()
    require "configs.lspconfig"
  end,
}
