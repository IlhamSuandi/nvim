local M = {
  -- NOTE : catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("config.themes.catppuccin")
    end,
  },

  -- NOTE : kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    name = "kanagawa",
    config = function()
      require("config.themes.kanagawa")
    end,
  },

  -- NOTE : nord
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    name = "nord",
    config = function()
      require("config.themes.nord")
    end,
  },

  -- NOTE : rose-pine
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    config = function()
      require("config.themes.rose-pine")
    end,
  },

  -- NOTE : rasmus
  {
    "kvrohit/rasmus.nvim",
    lazy = true,
    name = "rasmus",
    config = function()
      require("config.themes.rasmus")
    end,
  },

  -- NOTE : onedarkpro
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    name = "onedark",
    config = function()
      require("config.themes.onedarkpro")
    end,
  },

  -- NOTE : everforest
  {
    "sainnhe/everforest",
    lazy = true,
    name = "everforest",
    config = function()
      require("config.themes.everforest")
    end,
  },

  -- NOTE : tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    config = function()
      require("config.themes.tokyonight")
    end,
  },

  -- NOTE : everblush
  {
    "Everblush/nvim",
    lazy = true,
    name = "everblush",
    config = function()
      require("config.themes.everblush")
    end,
  },

  -- NOTE : moonfly
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = true,
    config = function()
      require("config.themes.moonfly")
    end,
  },
  {
    "Yazeed1s/minimal.nvim",
    name = "minimal",
    lazy = true,
    config = function()
      require("config.themes.minimal")
    end,
  },
}

Themes = {}

for _, plugin in ipairs(M) do
  table.insert(Themes, {
    name = plugin.name,
    colorscheme = plugin.name,
  })
end

return M
