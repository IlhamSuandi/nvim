-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    require("config.highlight").setup()
  end,
})

vim.cmd([[
  augroup clear_completion_highlight
    autocmd!
    autocmd CompleteDone * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=1000}
  augroup END
]])

-- Autocommand that runs before quitting Neovim
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    vim.cmd("ScopeSaveState")
  end,
  desc = "Run command before quitting Neovim",
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*", -- Trigger when all plugins are fully loaded
  callback = function()
    vim.cmd("ScopeLoadState") -- Load the scope state after initialization
  end,
  desc = "Run command after all plugins are loaded",
})

vim.api.nvim_create_autocmd(
  { "TextChanged", "TextChangedI", "TextChangedP", "VimResized", "LspAttach", "WinScrolled", "BufEnter" },
  {
    pattern = "*",
    callback = function()
      -- Save current cursor position
      local cursor_pos = vim.api.nvim_win_get_cursor(0)

      -- Search for hex color codes without moving the cursor
      if vim.fn.search("#[0-9A-Fa-f]\\{6}", "nw") ~= 0 then
        vim.cmd("ColorizerAttachToBuffer")
      end

      -- Restore cursor position
      vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
  }
)
