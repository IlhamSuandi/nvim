require("plugins.themes")

local themes = {
  catppuccin = "catppuccin",
  kanagawa = "kanagawa",
  nord = "nord",
  rosepine = "rose-pine",
  rasmus = "rasmus",
  darkvoid = "darkvoid",
  onedark = "onedark",
}

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = themes.catppuccin,
    },
  },

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

  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },

  {
    "psliwka/vim-smoothie",
    lazy = true,
    event = "VeryLazy",
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<C-n>", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
  },
}
