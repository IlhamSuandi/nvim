local icons = LazyVim.config.icons

return {
  sections = {
    lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
    lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return LazyVim.ui.fg("Constant") end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return LazyVim.ui.fg("Debug") end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return LazyVim.ui.fg("Special") end,
            },
      {
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
    },
    lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
        separator = { right = "" },
        left_padding = 2,
      },
    },
  },
  options = {
    section_separators = { left = "", right = "" },
  },
}