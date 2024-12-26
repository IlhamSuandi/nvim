return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    -- "ray-x/guihua.lua", -optional if you need floating window support
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
