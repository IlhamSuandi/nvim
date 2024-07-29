local lspEnsureInstalled = {
  "dartls", -- dart formatter
  "html", -- html formatter
  "javascript", -- javascript formatter
  "json", -- json formatter
  "lua", -- lua formatter
  "markdown", -- markdown formatter
  "python", -- python formatter
  "tsx", -- typescript formatter
  "typescript", -- typescript formatter
  "vim", -- vimscript formatter
  "yaml", -- yaml formatter
}

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
        ensure_installed = lspEnsureInstalled,
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
        opts = {},
      },
      opts = function(_, opts)
        table.insert(opts.sources, 1, {
          name = "supermaven",
          group_index = 1,
          priority = 100,
        })
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

    -- NOTE : flutter tools
    {
      "akinsho/flutter-tools.nvim",
      lazy = false,
      event = "VeryLazy",
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
}
