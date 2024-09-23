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
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          style = { "#ffffff" },
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
  -- {
  --   "vague2k/huez.nvim",
  --   enabled = true,
  --   event = "UIEnter",
  --   config = function()
  --     require("config.huez")
  --   end,
  -- },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = Themes, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end,
  },

  -- NOTE : twilight for dimming
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>zt", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    config = function()
      require("config.twilight")
    end,
  },

  -- NOTE : zen mode
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    config = function()
      require("config.zen-mode")
    end,
  },

  {
    "pocco81/true-zen.nvim",
    event = "VeryLazy",
    lazy = true,
    keys = {
      { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "Toggle Ataraxis Mode" },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "Toggle Ataraxis Mode" },
      { "<leader>zn", "<cmd>TZNarrow<cr>", desc = "Toggle Narrow Mode" },
      { "<leader>zf", "<cmd>TZFocus<cr>", desc = "Toggle Focus Mode" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return require("config.lualine")
    end,
  },
}
