-- local tabufline = require "nvchad.tabufline"

-- NOTE: buffer related
-- Keymap("n", "<leader>bl", function()
--   tabufline.closeBufs_at_direction "right"
-- end, { desc = "buffer close right", silent = true, noremap = true })
--
-- Keymap("n", "<leader>bh", function()
--   tabufline.closeBufs_at_direction "left"
-- end, { desc = "buffer close left", silent = true, noremap = true })
--
-- Keymap("n", "<A-l>", function()
--   tabufline.next()
-- end, { desc = "buffer goto next" })
--
-- Keymap("n", "<A-h>", function()
--   tabufline.prev()
-- end, { desc = "buffer goto prev" })
--
-- Keymap("n", "<A-H>", function()
--   tabufline.move_buf(-1)
-- end, { desc = "buffer move to prev" })
--
-- Keymap("n", "<A-L>", function()
--   tabufline.move_buf(1)
-- end, { desc = "buffer move to next" })
--
-- Keymap("n", "<leader>bd", function()
--   Snacks.bufdelete()
-- end, { desc = "Delete Buffer" })
--
-- Keymap("n", "<leader>bo", function()
--   Snacks.bufdelete.other()
-- end, { desc = "Delete Other Buffers" })

-- keys = {
--   { "n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "BufferLineCyclePrev" },
--   { "n", "<leader>bd", "<cmd>BufferLineClose<cr>", desc = "BufferLineClose" },
--   { "n", "<leader>bo", "<cmd>BufferLineCloseAllButCurrent<cr>", desc = "BufferLineCloseAllButCurrent" },
--   { "n", "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "BufferLineSortByDirectory" },
--   { "n", "<leader>bF", "<cmd>BufferLineSortByExtension<cr>", desc = "BufferLineSortByExtension" },
--   { "n", "<leader>bR", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "BufferLineSortByRelativeDirectory" },
--   { "n", "<A-L>", "<cmd>BufferLineMoveNext<cr>", desc = "BufferLineMoveNext" },
--   { "n", "<A-H>", "<cmd>BufferLineMovePrev<cr>", desc = "BufferLineMovePrev" },
--   { "n", "gb", "<cmd>BufferLinePick<cr>", desc = "BufferLinePick" },
--   { "n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "BufferLineGoToBuffer 1" },
--   { "n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "BufferLineGoToBuffer 2" },
--   { "n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "BufferLineGoToBuffer 3" },
--   { "n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "BufferLineGoToBuffer 4" },
--   { "n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "BufferLineGoToBuffer 5" },
--   { "n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "BufferLineGoToBuffer 6" },
--   { "n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "BufferLineGoToBuffer 7" },
--   { "n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "BufferLineGoToBuffer 8" },
--   { "n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "BufferLineGoToBuffer 9" },
-- },

Keymap("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "BufferLineCycleNext" })
Keymap("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "BufferLineCyclePrev" })
Keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "BufferLineCloseOthers" })
Keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "BufferLineClose" })
Keymap("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "BufferLineCloseRight" })
Keymap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "BufferLineCloseLeft" })
Keymap("n", "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", { desc = "BufferLineSortByDirectory" })
Keymap("n", "<leader>bF", "<cmd>BufferLineSortByExtension<cr>", { desc = "BufferLineSortByExtension" })
Keymap("n", "<leader>bR", "<cmd>BufferLineSortByRelativeDirectory<cr>", { desc = "BufferLineSortByRelativeDirectory" })
Keymap("n", "<A-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "BufferLineMoveNext" })
Keymap("n", "<A-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "BufferLineMovePrev" })
Keymap("n", "gb", "<cmd>BufferLinePick<cr>", { desc = "BufferLinePick" })
Keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "BufferLineGoToBuffer 1" })
Keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "BufferLineGoToBuffer 2" })
Keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "BufferLineGoToBuffer 3" })
Keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "BufferLineGoToBuffer 4" })
Keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "BufferLineGoToBuffer 5" })
Keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "BufferLineGoToBuffer 6" })
Keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "BufferLineGoToBuffer 7" })
Keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "BufferLineGoToBuffer 8" })
Keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "BufferLineGoToBuffer 9" })
