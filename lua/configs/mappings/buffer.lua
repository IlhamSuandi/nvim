local tabufline = require "nvchad.tabufline"

-- NOTE: buffer related
Keymap("n", "<leader>bl", function()
  tabufline.closeBufs_at_direction "right"
end, { desc = "buffer close right", silent = true, noremap = true })

Keymap("n", "<leader>bh", function()
  tabufline.closeBufs_at_direction "left"
end, { desc = "buffer close left", silent = true, noremap = true })

Keymap("n", "<A-l>", function()
  tabufline.next()
end, { desc = "buffer goto next" })

Keymap("n", "<A-h>", function()
  tabufline.prev()
end, { desc = "buffer goto prev" })

Keymap("n", "<A-H>", function()
  tabufline.move_buf(-1)
end, { desc = "buffer move to prev" })

Keymap("n", "<A-L>", function()
  tabufline.move_buf(1)
end, { desc = "buffer move to next" })

Keymap("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

Keymap("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
