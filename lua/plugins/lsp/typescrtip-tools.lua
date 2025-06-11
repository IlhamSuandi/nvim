return {
  "pmizio/typescript-tools.nvim",
  lazy = false,
  ft = { "typescript", "javascript" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
    -- stylua: ignore 
  keys = {
    { "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
    { "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
    { "<leader>cU", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused Statements" },
    { "<leader>cM", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
    { "<leader>cF", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
  },
}
