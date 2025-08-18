-- NOTE : formatter
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumt", "goimports" },
      typescriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
    },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
  keys = {
    {
      mode ={ "v" ,"n" },
      "<leader>cf",
      function()
        require("conform").format { lsp_fallback = true, async = true }
      end,
      desc = "general format file",
    },
  },
  config = function(_, opts)
    require "conform".setup(opts)
  end,
}
