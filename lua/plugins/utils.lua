return {
  -- NOTE : which-key for keymapping
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>n", group = "notifications" },
        { "<leader>z", group = "zen mode" },
        { "<leader>gx", group = "Git Conflicts" },
        { "<leader>h", group = "Harpoon" },
      },
    },
  },

  -- NOTE : mini.ai
  -- {
  --   "echasnovski/mini.ai",
  --   event = "VeryLazy",
  --   config = function()
  --     require("config.mini-ai")
  --   end,
  -- },

  -- NOTE : neocord for discord
  {
    "IogaMaster/neocord",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("config.discord")
    end,
  },

  -- NOTE : lsp saga for lsp actions
  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    opts = {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
        show_file = false,
        hide_keyword = true,
      },
      outline = {
        keys = {
          toggle_or_jump = "<CR>",
        },
        win_width = 50,
      },
    },
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
  },

  -- NOTE : leetcode things
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      image_support = true,
    },
  },

  -- NOTE : plugin to show image
  {
    "3rd/image.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = { "markdown" },
            highlight = { enable = true },
            modules = {},
            sync_install = false,
            ignore_install = {},
            auto_install = true,
          })
        end,
      },
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      kitty_method = "normal",
    },
  },

  -- NOTE : tmux integration
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   cmd = {
  --     "TmuxNavigateLeft",
  --     "TmuxNavigateDown",
  --     "TmuxNavigateUp",
  --     "TmuxNavigateRight",
  --     "TmuxNavigatePrevious",
  --   },
  --   keys = {
  --     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  --   },
  -- },

  -- NOTE : neotest for testing
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/neotest-jest",
  --     "nvim-neotest/neotest-go",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("config.neotest")
  --   end,
  -- },

  -- NOTE : obsidian for note taking
  -- {
  --   "epwalsh/obsidian.nvim",
  --   event = "VeryLazy",
  --   ft = "markdown",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "personal",
  --         path = "~/vaults/personal",
  --       },
  --       {
  --         name = "work",
  --         path = "~/vaults/personal",
  --         overrides = {
  --           notes_subdir = "works",
  --         },
  --       },
  --       {
  --         name = "project ideas",
  --         path = "~/vaults/personal/ideas",
  --         overrides = {
  --           notes_subdir = "ideas/project_ideas",
  --         },
  --       },
  --       {
  --         name = "brainstorming",
  --         path = "~/vaults/personal/ideas",
  --         overrides = {
  --           notes_subdir = "ideas/brainstorming",
  --         },
  --       },
  --     },
  --     notes_subdir = "notes",
  --     daily_notes = {
  --       folder = "notes/dailies",
  --       date_format = "%Y-%m-%d",
  --       alias_format = "%B %-d, %Y",
  --       default_tags = { "daily-notes" },
  --       template = "daily.md",
  --     },
  --     templates = {
  --       folder = "templates",
  --       date_format = "%Y-%m-%d-%a",
  --       time_format = "%H:%M",
  --     },
  --     ui = {
  --       enable = false,
  --     },
  --   },
  -- },
  -- NOTE : visual multi
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "gn",
        ["Find Subword Under"] = "gn",
        ["Add Cursor Down"] = "gj",
        ["Add Cursor Up"] = "gk",
      }
    end,
  },

  -- NOTE : tailwind tool
  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   ft = { "html", "css", "javascript", "typescript", "vue" },
  --   lazy = true,
  --   name = "tailwind-tools",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "neovim/nvim-lspconfig", -- optional
  --   },
  --   opts = {
  --     document_color = {
  --       inline_symbol = "󱓻 ", -- only used in inline mode
  --       debounce = 100, -- in milliseconds, only applied in insert mode
  --     },
  --   },
  -- },

  {
    "folke/flash.nvim",
    opts = {
      highlight = {
        -- show a backdrop with hl FlashBackdrop
        backdrop = false,
        -- Highlight the search matches
        matches = true,
        -- extmark priority
        priority = 5000,
        groups = {
          match = "FlashMatch",
          current = "FlashCurrent",
          backdrop = "FlashBackdrop",
          label = "FlashLabel",
        },
      },
      modes = {
        char = {
          enabled = true,
          highlight = { backdrop = false },
        },
      },
    },
  },

  {
    "tiagovla/scope.nvim",
    lazy = false,
    config = function()
      vim.opt.sessionoptions = { -- required
        "buffers",
        "tabpages",
        "globals",
      }
      require("scope").setup()
    end,
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    lazy = false,
    config = true,
  },

  {
    "NStefan002/screenkey.nvim",
    lazy = true,
    keys = {
      { "<leader>uS", "<cmd>Screenkey<cr>", desc = "ScreenKey enable" },
    },
    config = function()
      require("config.screenkey")
    end,
  },

  -- NOTE: fzf-lua for fuzzy search
  {
    "ibhagwan/fzf-lua",
    opts = {
      fzf_opts = {
        ["--no-scrollbar"] = false,
      },
    },
  },

  -- NOTE: better % functionality
  -- {
  --   "andymass/vim-matchup",
  --   lazy = false,
  --   event = "VeryLazy",
  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },

  {
    "gbprod/yanky.nvim",
    recommended = true,
    desc = "Better Yank/Paste",
    event = "VeryLazy",
    opts = {
      highlight = { timer = 150 },
    },
    keys = {
      {
        "<leader>p",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
        -- stylua: ignore
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
    },
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = {},
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>ha",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>hh",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
}
