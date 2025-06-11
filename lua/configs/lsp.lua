---Trigger a specific LSP code action
---@param action? '"quickfix"' | '"refactor"' | '"refactor.extract"' | '"refactor.inline"' | '"refactor.rewrite"' | '"source"' | '"source.organizeImports"' | '"source.fixAll"' | '"notebook"' | string
function code_action(action)
  local context = {
    diagnostics = {}
  }

  if action and action ~= "" then
    context.only = { action }
  end

  vim.lsp.buf.code_action({
    apply = true,
    context = context,
  })
end

-- on attach, disable document highlight
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = args.buf, silent = true, desc = "LSP Saga Hover" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf, silent = true, desc = "go to references" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, silent = true, desc = "code add missing imports" })
    vim.keymap.set("n", "<leader>co", function() code_action("source.organizeImports") end, { buffer = args.buf, silent = true, desc = "code organize imports" })
    vim.keymap.set("n", "<leader>cu", function() code_action("source.removeUnused") end, { buffer = args.buf, silent = true, desc = "code remove unused imports" })
    vim.keymap.set("n", "<leader>cM", function() code_action("source.addMissingImports") end, { buffer = args.buf, silent = true, desc = "code add missing imports" })

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    -- Disable word highlighting under the cursor
    if client.server_capabilities.documentHighlightProvider then
      client.server_capabilities.documentHighlightProvider = false
    end

    -- ban no information available on notify
    vim.notify = function(msg, level, opts)
      if msg == 'No information available' then
        return
      end
    end
  end,
})

-- enabled lsp servers
vim.lsp.enable({
  "lua-ls",
  "emmet-ls",
  "vtsls",
  "tailwindcss",
  "html",
  "eslint",
  "go",
})

-- default capabilities
vim.lsp.config('*', {
  capabilities = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
    semanticTokensProvider = nil,
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  }
})
