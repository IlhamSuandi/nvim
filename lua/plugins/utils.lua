return {
  -- NOTE : twilight for dimming
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.4, -- amount of dimming
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
  },

  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require("config.mini-ai")
    end,
  },

  -- NOTE : dial for increment/decrement
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>tb",
        function()
          local function dial(increment, g)
            local mode = vim.fn.mode(true)
            -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
            local is_visual = mode == "v" or mode == "V" or mode == "\22"
            local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
            local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
            return require("dial.map")[func](group)
          end

          return dial(true)
        end,
        expr = true,
        desc = "Increment",
        mode = { "n", "v" },
      },
      {
        "+",
        mode = { "n" },
        "<cmd>DialIncrement<cr>",
      },
      {
        "-",
        mode = { "n" },
        "<cmd>DialDecrement<cr>",
      },
    },

    opts = function()
      require("config.dial")
    end,
  },

  -- NOTE : discord rich presence
  {
    "andweeb/presence.nvim",
    event = "BufRead",
    opts = {
      -- General options
      auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
      neovim_image_text = "vscode killer!", -- Text displayed when hovered over the Neovim image
      main_image = "file", -- Main image display (either "neovim" or "file")
      client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
      log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
      debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
      enable_line_number = false, -- Displays the current line number instead of the current project
      blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      buttons = false, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
      file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
      show_time = true, -- Show the timer

      -- Rich Presence text options
      editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
      file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
      git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
      plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
      reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
      workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
      line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    },
    config = function(_, opts)
      require("presence").setup(opts)
    end,
  },

  -- NOTE : lsp saga for lsp actions
  {
    "nvimdev/lspsaga.nvim",
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
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
