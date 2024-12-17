-- Options are automatically loaded before lazy.nstartup
-- Default options that are always set: https://github.com/LazyLazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt
local g = vim.g
local wo = vim.wo

opt.confirm = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.showmode = true
opt.updatetime = 100
opt.completeopt = { "menu", "menuone", "noselect" }

wo.foldmethod = "manual"

-- NOTE : use prettier config from workspace instead of default
g.lazyvim_prettier_needs_config = true

-- NOTE: remove auto Lazy auto format
g.autoformat = false

g.lazyvim_picker = "fzf"
g.snacks_animate = false

-- g.matchup_matchparen_pumvisible = 0
vim.diagnostic.config({ virtual_text = false })
