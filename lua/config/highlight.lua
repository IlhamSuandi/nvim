local M = {}
M.setup = function()
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#424757" })
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
