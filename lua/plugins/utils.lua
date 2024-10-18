return {
  -- NOTE : which-key for keymapping
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>n", group = "notifications" },
        { "<leader>a", group = "AI" },
        { "<leader>z", group = "zen mode" },
        { "<leader>O", group = "Obsidian" },
        { "<leader>Oc", group = "Create" },
        { "<leader>m", group = "Manage Tabs" },
        { "<leader>gx", group = "Git Conflicts" },
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
    opts = {
      checkbox = {
        checked = {
          icon = "[✔] ",
          highlight = "RenderMarkdownChecked",
        },
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
        },
        custom = {
          unchecked = { raw = "[ ]", rendered = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
          checked = { raw = "[x]", rendered = "[✔] ", highlight = "RenderMarkdownChecked" },
          capitalized_checked = { raw = "[X]", rendered = "[✔] ", highlight = "RenderMarkdownChecked" },
          right_arrow = { raw = "[>]", rendered = "[󰥔] ", highlight = "DiagnosticWarn" },
          tilde = { raw = "[~]", rendered = "[✘] ", highlight = "RenderMarkdownTilde" },
          important = { raw = "[!]", rendered = "[] ", highlight = "DiagnosticError" },
        },
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownError" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
        caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
        abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
        summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo" },
        tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo" },
        info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
        todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
        hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess" },
        success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
        check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess" },
        done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
        question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
        help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn" },
        faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn" },
        attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn" },
        failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
        fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError" },
        missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError" },
        danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
        error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError" },
        bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
        example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
        quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
        cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote" },
        recurrent = { raw = "[!RECURRENT]", rendered = "󰨸 Recurrent", highlight = "RenderMarkdownWarn" },
      },
    },
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

  -- NOTE : snipe for picking buffers
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "gb",
        function()
          local toggle = require("snipe").create_buffer_menu_toggler({
            max_path_width = 2,
          })
          toggle()
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
    event = "VeryLazy",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    config = function()
      require("config.parrot")
    end,
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
  {
    "epwalsh/obsidian.nvim",
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/personal",
          overrides = {
            notes_subdir = "works",
          },
        },
        {
          name = "project ideas",
          path = "~/vaults/personal/ideas",
          overrides = {
            notes_subdir = "ideas/project_ideas",
          },
        },
        {
          name = "brainstorming",
          path = "~/vaults/personal/ideas",
          overrides = {
            notes_subdir = "ideas/brainstorming",
          },
        },
      },
      notes_subdir = "notes",
      daily_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily-notes" },
        template = "daily.md",
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      ui = {
        enable = false,
      },
    },
  },
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
    lazy = false,
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {
      document_color = {
        inline_symbol = "󱓻 ", -- only used in inline mode
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
    "kien/tabman.vim",
    lazy = false,
    event = "VeryLazy",
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
    lazy = false,
    config = function()
      require("config.screenkey")
    end,
  },
}
