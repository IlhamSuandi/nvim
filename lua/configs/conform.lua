local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumt", "goimports" },
    tsx = { "prettier" },
    ts = { "prettier" },
    js = { "prettier" },
    jsx = { "prettier" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
