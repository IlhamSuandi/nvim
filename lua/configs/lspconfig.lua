-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {

  -- NOTE: lua
  "lua_ls",

  -- NOTE: typescript / javascript
  "html",
  "cssls",
  "vtsls",
  "eslint",
  "jsonls",
  "tailwindcss",
  "emmet_ls",

  -- NOTE: markdown
  -- "marksman",

  -- NOTE: golang
  "gopls",

  -- NOTE: python
  "pyright",
  "ruff",

  -- NOTE: Latex
  "texlab",
  -- "tree-sitter-cli",

  -- NOTE: shell
  -- "shellcheck",
  -- "shfmt",
}

local nvlsp = require "nvchad.configs.lspconfig"

local ooo = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  -- delete default keymap
  vim.keymap.del("n", "<leader>ca", { buffer = bufnr })
  vim.keymap.del("n", "<leader>ra", { buffer = bufnr })
  vim.keymap.del("n", "<leader>D", { buffer = bufnr })
  vim.keymap.del("n", "<leader>wa", { buffer = bufnr })
  vim.keymap.del("n", "<leader>wl", { buffer = bufnr })
  vim.keymap.del("n", "<leader>wr", { buffer = bufnr })

  -- typescript lang
  if client.name == "vtsls" then
    require("configs.lang.typescript").setup(bufnr)
  end

  -- python lang
  if client.name == "ruff" or client.name == "ruff_lsp" then
    require("configs.lang.python").setup(bufnr)
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = ooo,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
