local function disable(plugins)
  local disabled_plugins = {}
  for _, plugin in ipairs(plugins) do
    table.insert(disabled_plugins, { plugin, enabled = false })
  end

  return disabled_plugins
end

return disable {
  "3rd/image.nvim",   -- image viewer
  "hrsh7th/nvim-cmp", -- completion
  -- "saghen/blink.cmp", -- completion
  -- "saghen/blink.compat", -- completion
  "folke/noice.nvim",              -- notifications
  "kiyoon/jupynium.nvim",          -- jupyter notebook things
  "pmizio/typescript-tools.nvim",  -- typescript things
  "nvim-telescope/telescope.nvim", -- fuzzy finder
  "nvim-tree/nvim-tree.lua",       -- file explorer

  "IogaMaster/neocord",
  "karb94/neoscroll.nvim",      -- animation
  "akinsho/flutter-tools.nvim", -- flutter
  "MagicDuck/grug-far.nvim",    -- search and replace
  "ray-x/go.nvim",              -- go
  "nvim-neotest/nvim-nio",      -- dap dependencies
  "luarocks/hererocks",         -- luarocks
  "mistweaverco/kulala.nvim",   -- rest api testing
  "nvzone/minty",               -- nvchad things
  "nvzone/volt",                -- nvchad things
  "neovim/nvim-lspconfig",      -- lsp configs
  "pmizio/typescript-tools.nvim",
  "tanvirtin/vgit.nvim",        -- git view
}
