local M = {}
M.setup = function()
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#424757" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
  vim.api.nvim_set_hl(0, "IblIndent", { fg = "#7c7f93" })
  vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#dce0e8" })
  vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = "#dce0e8" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#8b9199", bg = "none", italic = true })
  vim.api.nvim_set_hl(0, "BufferLineBufferBackground", { bg = "#949cbc" })
  vim.api.nvim_set_hl(0, "@lsp.type.comment", { fg = "#8b9199", bg = "none", italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#8b9199", bg = "none", italic = true })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#424757" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#8b9199" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#424757" })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })

  -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#424757" })
  -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "white" })
end

return M
