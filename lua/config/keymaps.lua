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

map({ "n", "v", "i" }, "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map({ "n", "v", "i" }, "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map({ "n", "v", "i" }, "<A-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "move to prev buffer" })
map({ "n", "v", "i" }, "<A-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Next Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

map("i", "<C-l>", "<Left>", { desc = "go to left in insert mode" })
map("i", "<C-h>", "<Left>", { desc = "go to left in insert mode" })
-- --

-- NOTE : noice mappings
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "noice dismiss notification" })
map("n", "<leader>nl", "<cmd>NoiceLast<CR>", { desc = "noice last notification" })
map("n", "<leader>nt", "<cmd>NoiceTelescope<CR>", { desc = "noice telescope" })

-- NOTE : presence nvim
map("n", "<leader>pu", "<cmd>lua require('presence'):update()<cr>", { desc = "presence update" })
map("n", "<leader>pc", "<cmd>lua require('presence'):cancel()<cr>", { desc = "presence close/cancel" })

-- NOTE : lspsaga
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts("lspsaga code action"))
map("n", "<leader>cd", "<cmd>Lspsaga peek_definition<cr>", opts("lspsaga peek definition"))
map("n", "<leader>co", "<cmd>Lspsaga outline<cr>", opts("lspsaga outline"))
map("n", "<leader>ce", "<cmd>Lspsaga show_buf_diagnostics<cr>", opts("lspsaga show buf diagnostics"))
map("n", "<leader>cE", "<cmd>Lspsaga show_workspace_diagnostics<cr>", opts("lspsaga show workspace diagnostics"))
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts("lspsaga hover doc"))
map("n", "en", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts("lspsaga jump to next diagnostic"))
map("n", "ep", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts("lspsaga jump to prev diagnostic"))
map("n", "es", "<cmd>Lspsaga show_line_diagnostics<cr>", opts("lspsaga show line diagnostics"))

-- NOTE : parrot for ai stuff
map("n", "<leader>aP", "<cmd>AIProvider<cr>", opts("AI Change Provider"))
map("n", "<leader>am", "<cmd>AIModel<cr>", opts("AI Change Model"))
map("n", "<leader>ac", "<cmd>AIChatNew<cr>", opts("AI New Chat"))
map("n", "<leader>ad", "<cmd>AIChatDelete<cr>", opts("AI Delete Chat"))
map("n", "<leader>af", "<cmd>AIChatFinder<cr>", opts("AI Find Chat"))
map("n", "<leader>at", "<cmd>AIChatToggle<cr>", opts("AI Toggle Chat"))
map({ "n", "x", "v" }, "<leader>ar", ":'<,'>AIRewrite<cr>", opts("AI Rewrite"))
map({ "n", "x", "v" }, "<leader>ai", ":'<,'>AIImplement<cr>", opts("AI Implement"))
map({ "n", "x", "v" }, "<leader>ap", ":'<,'>AIPrepend<cr>", opts("AI Prepend"))
map({ "n", "x", "v" }, "<leader>aa", ":'<,'>AIAppend<cr>", opts("AI Append"))

-- NOTE : remove keymap
unmap("n", "<leader>uC")
map("n", "<leader>uC", "<cmd>Huez<cr>", opts("Huez Change Theme"))
