local masonEnsureInstalled = {
  "stylua", -- lua formatter
  "shellcheck", -- shell script linter
  "shfmt", -- shell script formatter
  "flake8", -- python linter
  "emmet-ls", -- emmet for html
}

return {
  {
    {
      "nvim-lspconfig",
      opts = {
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

    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = masonEnsureInstalled,
      },
    },

    {
      -- NOTE : supermaven completion
      "nvim-cmp",
      dependencies = {
        "supermaven-inc/supermaven-nvim",
        build = ":SupermavenUseFree", -- remove this line if you are using pro
        opts = {
          log_level = "off", -- set to "off" to disable logging completely
        },
      },
      opts = function(_, opts)
        table.insert(opts.sources, 1, {
          name = "supermaven",
          group_index = 1,
          priority = 100,
        })
        table.insert(opts.experimental.ghost_text, false)
      end,
    },

    -- NOTE : completions for command line
    {
      "nvim-cmp",
      event = "VeryLazy",
      dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
      },
      opts = function()
        require("config.completion")
      end,
    },

    {
      "mfussenegger/nvim-dap",
      recommended = true,
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
    {

      "leoluz/nvim-dap-go",
      dependencies = {
        "mfussenegger/nvim-dap",
      },
      ft = "go",
      config = function()
        require("dap-go").setup({
          dap_configurations = {
            {
              type = "go",
              name = "Debugging",
              request = "launch",
              program = "${workspaceFolder}/cmd/server",
            },
          },
        })
      end,
    },

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
  },

  {
    "kmonad/kmonad-vim",
    lazy = false,
    event = "VeryLazy",
  },
}
