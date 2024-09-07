return {
  -- NOTE : catppuccin
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("config.themes.catppuccin")
    end,
  },

  -- NOTE : kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    config = function()
      require("config.themes.kanagawa")
    end,
  },

  -- NOTE : nord
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    name = "nord",
    config = function()
      require("config.themes.nord")
    end,
  },

  -- NOTE : rose-pine
  {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    config = function()
      require("config.themes.rose-pine")
    end,
  },

  -- NOTE : rasmus
  {
    "kvrohit/rasmus.nvim",
    lazy = false,
    name = "rasmus",
    config = function()
      require("config.themes.rasmus")
    end,
  },

  -- NOTE : onedarkpro
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    name = "onedarkpro",
    config = function()
      require("config.themes.onedarkpro")
    end,
  },

  -- NOTE : everforest
  {
    "sainnhe/everforest",
    lazy = false,
    name = "everforest",
    config = function()
      require("config.themes.everforest")
    end,
  },
}
