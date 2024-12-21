-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chocolate",
  transparency = true,

  hl_override = {
    ["CursorLineNr"] = { bg = "none", fg = "#dce0e8", bold = true },
    ["CursorLine"] = { bg = "none" },
    ["LineNr"] = { fg = "#6c6f85" },
    ["Visual"] = { bg = "#5c5f77" },
    ["TelescopeBorder"] = { bg = "none" },
    ["TelescopeTitle"] = { bg = "none" },
    ["FloatBorder"] = { bg = "none" },
    ["NormalFloat"] = { bg = "none" },
    ["StatusLine"] = { bg = "none" },
    ["DiagnosticSignInfo"] = { bg = "NONE" },
    ["StatusLineNC"] = { bg = "none" },
    ["FloatTitle"] = { bg = "none" },
    ["IblIndent"] = { fg = "#303446" },
    ["IblScope"] = { fg = "#6c6f85" },
    ["BufferLineBufferSelected"] = { fg = "#eff1f5", bold = true },
    ["BufferLineBufferVisible"] = { fg = "#eff1f5" },
    ["Comment"] = { fg = "#8b9199", bg = "none", italic = true },
    ["@lsp.type.comment"] = { fg = "#8b9199", bg = "none", italic = true },
    ["@comment"] = { fg = "#8b9199", bg = "none", italic = true },
    ["TelescopeSelection"] = { bg = "#303446", fg = "#eff1f5" },
  },
}

M.ui = {
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true,
    },
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = {
      "mode",
      "file",
      "git",
      "noice_recording",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
    },
    modules = {
      noice_recording = function()
        local noice = require "noice"
        local recording_status = noice.api.statusline.mode.get()
        if noice.api.statusline.mode.has() and recording_status:find "recording" then
          return "%#ErrorMsg# " .. recording_status .. " "
        else
          return ""
        end
      end,
    },
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = false,
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
