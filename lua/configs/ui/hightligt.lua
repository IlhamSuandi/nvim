vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#dce0e8", bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c6f85" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#5c5f77" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#303446" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#6c6f85" })
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#303446" })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#6c6f85" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#8b9199", bg = "none", italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.comment", { fg = "#8b9199", bg = "none", italic = true })
vim.api.nvim_set_hl(0, "@comment", { fg = "#8b9199", bg = "none", italic = true })
vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#5c5f77" })
vim.api.nvim_set_hl(0, "Substitute", { bg = "#5c5f77" })

-- Set transparent background for BufferLine highlights
-- Loop through all highlight groups and set bg to "none" for BufferLine groups
for _, group in ipairs(vim.fn.getcompletion("BufferLine", "highlight")) do
  if group:match "^BufferLine" then
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

vim.api.nvim_set_hl(0, "BufferLineBuffer", { fg = "#4A4A5A", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "BufferLineTab", { fg = "#4A4A5A", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#eff1f5", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "BufferLineInfoSelected", { fg = "#eff1f5", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "BufferLineInfoDiagnosticSelected", { fg = "#eff1f5", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "BufferLineHintSelected", { fg = "#eff1f5", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = "#eff1f5", bg = "NONE" })
vim.api.nvim_set_hl(0, "BufferLineWarningSelected", { bg = "NONE", fg = "#eff1f5", bold = true })
vim.api.nvim_set_hl(0, "BufferLineErrorSelected", { bg = "NONE", fg = "#eff1f5", bold = true })
vim.api.nvim_set_hl(0, "NotificationInfo", { bg = "NONE" })
