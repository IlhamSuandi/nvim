Keymap("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git Toggle Blame line" })
Keymap("n", "]h", function() require("gitsigns").nav_hunk("next") end, { desc = "Git Next Hunk" })
Keymap("n", "[h", function() require("gitsigns").nav_hunk("prev") end, { desc = "Git Prev Hunk" })
