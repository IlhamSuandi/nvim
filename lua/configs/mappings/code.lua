-- NOTE: code related mappings

Keymap("n", "<leader>cm", "<cmd>Mason<cr>", { noremap = true, silent = true })

-- formatting
Keymap("n", "<leader>cf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })
