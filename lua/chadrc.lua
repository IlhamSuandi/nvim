-- Please read that file to know all available options :(

---@type ChadrcConfig
---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadtain",
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
    ["NonText"] = { fg = "#8b9199", bg = "none" },
    ["Search"] = { bg = "#5c5f77", fg = "none" },
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
      "pad",
      "mode",
      "file",
      "git",
      -- "noice_recording",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
    },
    modules = {
      pad = " ",
      file = function()
        local config = require("nvconfig").ui.statusline
        local sep_style = config.separator_style
        local utils = require "nvchad.stl.utils"

        sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block" or sep_style

        local sep_icons = utils.separators
        local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]

        local sep_l = separators["left"]
        local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"

        local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
          return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
        end

        local icon = "󰈚"

        -- Get the full file path
        local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~") -- Get the current working directory
        local file = vim.fn.expand "%:p" -- Get the full path of the current file
        local file_name = vim.fn.fnamemodify(file, ":t") -- Extract the file name
        local rel_path = vim.fn.fnamemodify(file, ":~:h"):gsub("^" .. vim.pesc(cwd), "") -- Path relative to the working directory

        -- Split the relative path into components
        local parts = vim.split(rel_path, "/", { plain = true })

        -- Determine the display path
        local display_path
        if #parts > 2 then
          -- More than 2 folders before the file
          display_path = "~/../" .. parts[#parts] .. "/" .. file_name
        elseif #parts == 2 then
          -- Exactly 1 folder before the file
          display_path = "~/" .. parts[#parts] .. "/" .. file_name
        elseif #parts == 1 and parts[1] ~= "" then
          -- Only 1 folder exists
          display_path = "~/" .. parts[1] .. "/" .. file_name
        else
          -- File is directly in the working directory
          display_path = "~/" .. file_name
        end

        -- Add devicons for the file type
        local devicons_present, devicons = pcall(require, "nvim-web-devicons")
        if devicons_present then
          local ft_icon = devicons.get_icon(file_name)
          icon = (ft_icon ~= nil and ft_icon) or icon
        end

        -- Combine and return the final string
        return gen_block(icon, display_path, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#")
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

M.nvdash = {
  load_on_startup = false,
}

return M
