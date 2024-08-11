return {
  -- NOTE : darkvoid
  {
    "aliqyan-21/darkvoid.nvim",
    lazy = true,
    name = "darkvoid",
    config = function()
      require("config.themes.darkvoid")
    end,
  },

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

  -- NOTE : onedark
  {
    "navarasu/onedark.nvim",
    lazy = true,
    name = "onedark",
    config = function()
      require("config.themes.onedark")
    end,
  },
}
