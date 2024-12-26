local autocmd = vim.api.nvim_create_autocmd

-- Function to set Quickfix List-specific mappings
local function set_quickfix_mappings()
  vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>cclose<CR>", { noremap = true, silent = true })
end

-- Autocmd to apply mappings when entering the Quickfix List
autocmd("FileType", {
  pattern = "qf", -- FileType for Quickfix List
  callback = set_quickfix_mappings,
})

-- NOTE : highlight yank
autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- Autocommand to save the scope state when exiting Neovim
autocmd("QuitPre", {
  callback = function()
    -- vim.notify "Saving session..."
    vim.cmd [[ScopeSaveState]] -- Scope.nvim saving
  end,
  desc = "Run command before quitting Neovim",
})

autocmd("User", {
  group = vim.api.nvim_create_augroup("PersistenceLoad", { clear = true }),
  pattern = "PersistenceLoadPost",
  callback = function()
    vim.cmd "ScopeLoadState" -- Replace with any action you want after persistence load
  end,
  desc = "Load scope state after persistence restores a session",
})

-- NOTE: auto load session
-- autocmd("VimEnter", {
--   pattern = "*", -- Trigger when all plugins are fully loaded
--   callback = function()
--     require("persistence").load()
--   vim.cmd "ScopeLoadState" -- Load the scope state after initialization
--   end,
-- desc = "Run command after all plugins are loaded",
-- })
