require("plugins.themes")

local themes = {
  catppuccin = "catppuccin",
  kanagawa = "kanagawa",
  nord = "nord",
  rosepine = "rose-pine",
  rasmus = "rasmus",
  onedarkpro = "onedarkpro",
  everforest = "everforest",
}

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = themes.catppuccin,
    },
  },

  -- NOTE : hlchunk for chunk, indent, line_num
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          style = { "#CA9EE6" },
        },
        indent = {
          enable = false,
          priority = 1,
          use_treesitter = true,
          chars = { "│" },
          ahead_lines = 1,
          delay = 10,
          style = { "#424757" },
        },
        line_num = {
          style = { "#CA9EE6" },
          enable = false,
        },
      })
    end,
  },

  -- NOTE : nvim-colorizer for coloring
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },

  -- NOTE : bufferline for buffer navigation
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },

  -- NOTE : vim-smoothie for smooth scrolling
  {
    "psliwka/vim-smoothie",
    lazy = true,
    event = "VeryLazy",
  },

  -- NOTE : neo-tree for explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<C-n>", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
  },

  -- NOTE : noice for notifications
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },

  -- NOTE : colorscheme changer
  {
    "vague2k/huez.nvim",
    event = "UIEnter",
    config = function()
      require("config.huez")
    end,
  },
}
