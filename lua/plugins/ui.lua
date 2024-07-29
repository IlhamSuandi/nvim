return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      jflavour = "frappe", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
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
          enable = true,
          priority = 10,
          use_treesitter = false,
          chars = { "│" },
          ahead_lines = 5,
          delay = 100,
        },
        line_num = {
          style = { "#CA9EE6" },
          enable = true,
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
    event = "VeryLazy",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },

  {
    "psliwka/vim-smoothie",
    lazy = false,
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
