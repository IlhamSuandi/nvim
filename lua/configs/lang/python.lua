M = {}

M.setup = function(bufnr)
  vim.keymap.set("n", "<leader>co", function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    }
  end, { buffer = bufnr, desc = "Organize imports" })
end

return M
