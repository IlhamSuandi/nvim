-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local masonEnsureInstalled = {
  -- FIX: lua
  "lua_ls",

  -- FIX: typescript / javascript
  "html",
  "cssls",
  "vtsls",
  "eslint",
  "jsonls",
  "tailwindcss",
  "emmet_ls",

  -- FIX: markdown
  -- "marksman",

  -- FIX: golang
  "gopls",

  -- FIX: python
  -- "pyright",
  -- "black",
  -- "debugpy",
  -- "flake8",
  -- "ruff",

  -- FIX: Latex
  -- "texlab",
  -- "tree-sitter-cli",

  -- FIX: shell
  -- "shellcheck",
  -- "shfmt",
}

return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = masonEnsureInstalled,
    },
  },

  {
    "nvim-lspconfig",
    lazy = true,
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = { enabled = false },
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = "all" },
            format = true,
          },
        },
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>ca", false }
    end,
  },

  -- NOTE: supermaven nvim
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    event = "VeryLazy",
    build = ":SupermavenUseFree", -- remove this line if you are using pro
    opts = {
      log_level = "off", -- set to "off" to disable logging completely
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = "manual",
          -- Controls how the completion items are selected
          -- 'preselect' will automatically select the first item in the completion list
          -- 'manual' will not select any item by default
          -- 'auto_insert' will not select any item by default, and insert the completion items automatically
          -- when selecting them
        },
        menu = {
          auto_show = true,
        },
      },
    },
  },

  -- NOTE : completions for command line
  -- {
  --   "nvim-cmp",
  --   event = "VeryLazy",
  --   enabled = true,
  --   lazy = true,
  --   dependencies = {
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     {
  --       "supermaven-inc/supermaven-nvim",
  --       event = "VeryLazy",
  --       build = ":SupermavenUseFree", -- remove this line if you are using pro
  --       opts = {
  --         log_level = "off", -- set to "off" to disable logging completely
  --       },
  --     },
  --   },
  --   opts = function()
  --     require("config.completion")
  --   end,
  -- },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    keys = {
      {
        "<leader>dR",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },

      {
        "<leader>dr",
        function()
          require("dap").restart()
        end,
        desc = "Restart dap",
      },
    },
  },

  -- debugger for golang
  -- {
  --   "leoluz/nvim-dap-go",
  --   optional = true,
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   },
  --   ft = "go",
  --   config = function()
  --     require("dap-go").setup({
  --       dap_configurations = {
  --         {
  --           type = "go",
  --           name = "Debugging",
  --           request = "launch",
  --           program = "${workspaceFolder}/cmd/server",
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- NOTE : flutter tools
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("config.dap")
      require("flutter-tools").setup({
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {},
        },
      })
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  }
}
