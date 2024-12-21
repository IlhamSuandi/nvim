Snacks = require "snacks"

Keymap("n", "<leader>cR", function()
  Snacks.rename.rename_file()
end, { desc = "Rename File" })

Keymap("n", "<leader>cr", function()
  vim.lsp.buf.rename()
end, { desc = "Rename" })

Keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", Keymap_opts "lspsaga code action")
Keymap("n", "<leader>cp", "<cmd>Lspsaga peek_definition<cr>", Keymap_opts "lspsaga peek definition")
Keymap("n", "<leader>cs", "<cmd>Lspsaga outline<cr>", Keymap_opts "lspsaga outline")
Keymap("n", "<leader>ce", "<cmd>Lspsaga show_buf_diagnostics<cr>", Keymap_opts "lspsaga show buf diagnostics")
Keymap(
  "n",
  "<leader>cE",
  "<cmd>Lspsaga show_workspace_diagnostics<cr>",
  Keymap_opts "lspsaga show workspace diagnostics"
)
Keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", Keymap_opts "lspsaga hover doc")
Keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", Keymap_opts "lspsaga jump to next diagnostic")
Keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", Keymap_opts "lspsaga jump to prev diagnostic")
Keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", Keymap_opts "lspsaga show line diagnostics")
