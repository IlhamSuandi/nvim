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

-- Autocmd to set icons for `.env.*` files when a file is read/created
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".env.*",
  callback = function()
    local uv = vim.loop
    local devicons = require "nvim-web-devicons"

    -- Icon for `.env.*` files
    local env_icon = {
      icon = "",
      color = "#faf743",
      cterm_color = "185",
      name = "EnvWildcard",
    }

    -- Set filetype for `.env.*`
    vim.bo.filetype = "sh"

    -- Set icons for `.env.*` files in the project
    -- Get the current working directory
    local cwd = vim.fn.getcwd()

    -- Read the directory for `.env.*` files
    local handle = uv.fs_scandir(cwd)
    if not handle then
      return
    end

    while true do
      local name, type = uv.fs_scandir_next(handle)
      if not name then
        break
      end

      if name:match "^%.env%..+" and type == "file" then
        -- Apply the icon to each `.env.*` file found
        devicons.set_icon {
          [name] = env_icon,
        }
      end
    end
  end,
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
