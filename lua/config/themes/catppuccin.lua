require("catppuccin").setup({
  flavour = "frappe", -- latte, frappe, macchiato, mocha
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
    indent_blankline = { enabled = false },
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
    custom_highlights = function()
      return {
        CursorLineNr = { bg = "#424757" },
        CursorLine = { bg = "#424757" },
        LineNr = { fg = "#8b9199" },
        Visual = { bg = "#424757" },
        GitSignsAdd = { bg = "none" },
        GitSignsChange = { bg = "none" },
        GitSignsDelete = { bg = "none" },
      }
    end,
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
})
