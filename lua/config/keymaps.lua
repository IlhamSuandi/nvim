-- Keymaps are automatically loaded on the VeryLazy event Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

local opts = function(desc)
  if desc then
    return { desc = desc, silent = true, noremap = true }
  end
  return { silent = true, noremap = true }
end

map("i", "jj", "<Esc>", opts())
map({ "n", "v" }, "+", "<C-a>", opts())
map({ "n", "v" }, "-", "<C-x>", opts())
map("n", "vie", "ggVG", { desc = "everything visual everything" })
map("n", "yie", "ggVGy", { desc = "everything yank everything" })
map("n", "cie", "ggVGc", { desc = "everything change everything" })
map("n", "die", "ggVGd", { desc = "everything delete everything" })
map("n", "<Right>", "20zl", { desc = "scroll line to the right" })
map("n", "<Left>", "20zh", { desc = "scroll line to the left" })

-- NOTE : buffers
unmap("n", "<S-h>")
unmap("n", "<S-l>")
unmap("n", "[b")
unmap("n", "]b")
unmap("n", "<leader>bb")
unmap("n", "<leader>`")

map("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<A-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "move to prev buffer" })
map("n", "<A-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Next Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
-- --
-- NOTE : buffers
map("n", "<leader>zt", "<cmd>Twilight<cr>", { desc = "Twilight toggle" })

-- NOTE : noice mappings
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "noice dismiss notification" })
map("n", "<leader>nl", "<cmd>NoiceLast<CR>", { desc = "noice last notification" })
map("n", "<leader>nt", "<cmd>NoiceTelescope<CR>", { desc = "noice telescope" })

-- NOTE : presence nvim
map("n", "<leader>pu", ":lua require('presence'):update()<cr>", { desc = "presence update" })
map("n", "<leader>pc", ":lua require('presence'):cancel()<cr>", { desc = "presence close/cancel" })

-- NOTE : lspsaga
map({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opts("lspsaga code action"))
map("n", "<leader>cd", ":Lspsaga peek_definition<cr>", opts("lspsaga peek definition"))
map("n", "<leader>co", ":Lspsaga outline<cr>", opts("lspsaga outline"))
map("n", "<leader>ce", ":Lspsaga show_buf_diagnostics<cr>", opts("lspsaga show buf diagnostics"))
map("n", "<leader>cE", ":Lspsaga show_workspace_diagnostics<cr>", opts("lspsaga show workspace diagnostics"))
map("n", "K", ":Lspsaga hover_doc<cr>", opts("lspsaga hover doc"))
map("n", "en", ":Lspsaga diagnostic_jump_next<cr>", opts("lspsaga jump to next diagnostic"))
map("n", "ep", ":Lspsaga diagnostic_jump_prev<cr>", opts("lspsaga jump to prev diagnostic"))
map("n", "es", ":Lspsaga show_line_diagnostics<cr>", opts("lspsaga show line diagnostics"))
