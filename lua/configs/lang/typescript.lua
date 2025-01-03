M = {}

M.setup = function(bufnr)
  vim.keymap.set("n", "<leader>cM", function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { "source.addMissingImports" },
        diagnostics = {},
      },
    }
  end, { buffer = bufnr, desc = "Add missing imports" })
  vim.keymap.set("n", "<leader>cF", function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { "source.fixAll.ts" },
        diagnostics = {},
      },
    }
  end, { buffer = bufnr, desc = "Fix all" })
  vim.keymap.set("n", "<leader>cu", function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { "source.removeUnused.ts" },
        diagnostics = {},
      },
    }
  end, { buffer = bufnr, desc = "Remove unused imports" })
end

return M
