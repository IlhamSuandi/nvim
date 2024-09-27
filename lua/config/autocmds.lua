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
    vim.cmd("echo 'All plugins are loaded'")
    vim.cmd("ScopeLoadState") -- Load the scope state after initialization
  end,
  desc = "Run command after all plugins are loaded",
})
