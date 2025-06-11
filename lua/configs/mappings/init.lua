-- make global keymap
Keymap = vim.keymap.set
RemoveKeymap = vim.keymap.del
Keymap_opts = function(desc)
  if desc then
    return { desc = desc, silent = true, noremap = true }
  end
  return { silent = true, noremap = true }
end

-- NOTE: buffer related mappings
require "configs.mappings.buffer"

-- NOTE: code related mappings
require "configs.mappings.code"

-- NOTE: session related mappings
require "configs.mappings.session"

-- NOTE: terminal related mappings
require "configs.mappings.terminal"

-- NOTE: lsp related mappings
require "configs.mappings.lsp"

-- NOTE: ui related mappings
require "configs.mappings.ui"

-- NOTE: ui related mappings
require "configs.mappings.git"

Keymap("i", "jk", "<ESC>")
Keymap("i", "jj", "<ESC>")
Keymap("i", "Jj", "<ESC>")
Keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", Keymap_opts "general clear highlights")

-- NOTE: move line
Keymap("n", "<a-j>", ":m+<cr>", Keymap_opts "move line down")
Keymap("i", "<a-j>", "<esc>:m+<cr>gi", Keymap_opts "move line down")
Keymap("i", "<a-k>", "<esc>:m-2<cr>gi", Keymap_opts "move line up")
Keymap("v", "<a-k>", ":m-2<cr>gvgv", Keymap_opts "move line up")
Keymap("n", "<a-k>", ":m-2<cr>", Keymap_opts "move line up")
Keymap("v", "<a-j>", ":m'>+<CR>gvgv", Keymap_opts "move line down")

Keymap("n", "<leader>l", "<cmd>Lazy<cr>", Keymap_opts "Lazy")

-- NOTE: motion for everything
Keymap("n", "vie", "ggVG", Keymap_opts "everything visual everything")
Keymap("n", "yie", "ggVGy", Keymap_opts "everything visual everything")
Keymap("n", "cie", "ggVGc", Keymap_opts "everything visual everything")
Keymap("n", "die", "ggVGd", Keymap_opts "everything visual everything")

-- nvimtree
-- Keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", Keymap_opts "nvimtree toggle window")
-- explorer
Keymap("n", "<C-n>", function()
  Snacks.explorer()
end, Keymap_opts "Open Explorer")

-- save file
Keymap("n", "<C-s>", "<cmd>w<CR>", Keymap_opts "Save File")
Keymap("n", "L", "<cmd>cnext<CR>", Keymap_opts "Quickfix List Next")
Keymap("n", "H", "<cmd>cprevious<CR>", Keymap_opts "Quickfix List Previous")

-- NOTE: tab related
Keymap("n", "<Tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
Keymap("n", "<Tab><Tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
Keymap("n", "<Tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
Keymap("n", "<Tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
Keymap("n", "<Tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- NOTE: window related
Keymap("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
Keymap("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
Keymap("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
Keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- NOTE: horizontal scroll
Keymap("n", "<Right>", "10zl", { desc = "Scroll Right", remap = true })
Keymap("n", "<Left>", "10zh", { desc = "Scroll Left", remap = true })

Keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
Keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
Keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
Keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

Keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open Tree on Buffer" })

Keymap("n", "]c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Go to context" })

Keymap("n", "<leader>ut", "<cmd>TSContextToggle<cr>", { desc = "Toggle Treesitter Context" })
