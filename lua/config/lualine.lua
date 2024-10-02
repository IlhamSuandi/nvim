local icons = LazyVim.config.icons
local auto_theme_custom = require("lualine.themes.auto")
auto_theme_custom.normal.c.bg = "none"
auto_theme_custom.normal.b.bg = "none"

return {
  sections = {
    lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
    lualine_x = {
      -- stylua: ignore
      {
        function()
          local noiceStatus = require("noice").api.status.mode.get() 
          if noiceStatus:find "recording" then
            return noiceStatus
          end
          return ""
        end,
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
    theme = auto_theme_custom,
    section_separators = { left = "", right = "" },
  },
}
