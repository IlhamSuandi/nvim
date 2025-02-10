return {
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>ee", "<cmd>TSJToggle<cr>", desc = "expand toggle" },
  },
  config = function()
    require("treesj").setup {
      use_default_keymaps = false,
    }
  end,
}
