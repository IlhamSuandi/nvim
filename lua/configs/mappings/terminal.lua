Snacks = require "snacks"

Keymap("n", "<c-/>", function()
  Snacks.terminal(nil)
end, { desc = "Terminal (Root Dir)" })
Keymap("n", "<c-_>", function()
  Snacks.terminal(nil)
end, { desc = "which_key_ignore" })

-- Terminal Mappings
Keymap("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
Keymap("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
