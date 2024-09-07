return {

  -- NOTE : twilight for dimming
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.5, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = { "Normal", "#ffffff" },
        term_bg = "#303446", --  if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 10, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
      -- treesitter is used to automatically expand the visible text,
      -- but you can further control the types of nodes that should always be fully expanded
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {}, -- exclude these filetypes
    },
    keys = {
      { "<leader>zt", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    event = "VeryLazy",
  },

  -- NOTE : mini.ai
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require("config.mini-ai")
    end,
  },

  -- NOTE : discord rich presence
  {
    "andweeb/presence.nvim",
    event = "BufRead",
    config = function()
      require("config.discord")
    end,
  },

  -- NOTE : lsp saga for lsp actions
  {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    lazy = true,
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
    opts = {},
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  },

  -- NOTE : leetcode things
  {
    "kawre/leetcode.nvim",
    -- event = "VeryLazy",
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

  -- NOTE : console ninja alternative
  {
    "metakirby5/codi.vim",
    event = "VeryLazy",
    config = function()
      vim.g["codi#interpreters"] = {
        python = {
          bin = "/usr/bin/python3",
          prompt = "^\\(>>>\\|\\.\\.\\.\\) ",
        },
      }
    end,
  },

  -- NOTE : snipe for picking buffers
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "gb",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    opts = {
      hints = {
        dictionary = "123456789",
      },
      navigate = {
        cancel_snipe = "q",
      },
    },
  },

  -- NOTE : hardtime
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- NOTE : zen mode
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        width = 1, -- width of the Zen window
        -- * a function that returns the width or the height
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = "yes", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 3, -- turn off the statusline in zen mode
        },
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
        tmux = { enabled = false }, -- disables the tmux statusline
        todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
        -- this will change the font size on kitty when in zen mode
        -- to make this work, you need to set the following kitty options:
        -- - allow_remote_control socket-only
        -- - listen_on unix:/tmp/kitty
        kitty = {
          enabled = true,
          font = "+4", -- font size increment
        },
      },
    },
  },

  -- NOTE : plugin to show image
  {
    "3rd/image.nvim",
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

  -- NOTE : generate jsdoc
  {
    "heavenshell/vim-jsdoc",
    ft = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" },
    build = "make install",
    event = "VeryLazy",
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

  -- NOTE : parrot for ai stuff
  {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    -- optionally include "rcarriga/nvim-notify" for beautiful notifications
    config = function()
      require("config.parrot")
    end,
  },
}
