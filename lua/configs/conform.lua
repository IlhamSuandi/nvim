local prettier = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.json5",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  ".prettierrc.toml",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
  "package.json",
}
local options = {
  -- formatters_by_ft = {
  --   lua = { "stylua" },
  --   go = { "gofumt", "goimports" },
  --   tsx = { "prettier" },
  --   ts = { "prettier" },
  --   js = { "prettier" },
  --   jsx = { "prettier" },
  --   -- css = { "prettier" },
  --   -- html = { "prettier" },
  -- },
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
