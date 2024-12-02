return {
  -- NOTE : which-key for keymapping
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>n", group = "notifications" },
        -- { "<leader>a", group = "AI" },
        { "<leader>z", group = "zen mode" },
        { "<leader>Oc", group = "Create" },
        { "<leader>gx", group = "Git Conflicts" },
        { "<leader>uS", group = "Screenkey Enable" },
      },
    },
  },

  -- NOTE : mini.ai
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require("config.mini-ai")
    end,
  },

  -- NOTE : neocord for discord
  {
    "IogaMaster/neocord",
    lazy = false,
    event = "VeryLazy",
    config = function()
      require("config.discord")
    end,
  },

  -- NOTE : lsp saga for lsp actions
  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
        show_file = false,
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

  -- NOTE : markdown preview
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    opts = {
      require("config.markdown-preview"),
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
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

  -- NOTE : make telescope showing image
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "IlhamSuandi/telescope-media-files.nvim" }, -- NOTE : this is my fork to fix --animate --center things...
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },

      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg" },
          -- find command (defaults to `fd`)
          find_cmd = "rg",
          preview_cmd = function(filepath)
            vim.fn.termopen(string.format("cd %s", filepath))
          end,
        },
      },
    },

    keys = {
      { "<leader>fa", "<cmd>Telescope media_files<cr>", desc = "Find asset media files" },
    },

    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("media_files")
    end,
  },

  -- NOTE : markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && yarn install",
    config = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  -- NOTE : tmux integration
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- NOTE : neotest for testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-go",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("config.neotest")
    end,
  },

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
  {
    "luckasRanarison/tailwind-tools.nvim",
    ft = { "html", "css", "javascript", "typescript", "vue" },
    lazy = true,
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {
      document_color = {
        inline_symbol = "󱓻 ", -- only used in inline mode
        debounce = 100, -- in milliseconds, only applied in insert mode
      },
    },
  },

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

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "gemini", -- You can then change this provider here
      gemini = { -- see https://ai.google.dev/api/generate-content#request-body_1
        generationConfig = {
          stopSequences = { "test" },
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
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

  -- NOTE: to faster load heavy files
  {
    "pteroctopus/faster.nvim",
  },

  -- NOTE: better % functionality
  {
    "andymass/vim-matchup",
    lazy = false,
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
