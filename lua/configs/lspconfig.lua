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

  -- NOTE: flutter
  "dartls",
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

  -- dart lang
  -- stylua: ignore
  if client.name == "dartls" then
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {  desc = "Go to definition", noremap = true })
    -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {  desc = "Show Hover", noremap = true })
    -- vim.keymap.set({ "n", "x" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", {   desc = "Code action", noremap = true })
    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
      }
    end, {  desc = "Organize imports" })
  end
end

local function get_quarto_resource_path()
  local function strsplit(s, delimiter)
    local result = {}
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
      table.insert(result, match)
    end
    return result
  end

  local f = assert(io.popen("quarto --paths", "r"))
  local s = assert(f:read "*a")
  f:close()
  return strsplit(s, "\n")[2]
end

local lua_library_files = vim.api.nvim_get_runtime_file("", true)
local lua_plugin_paths = {}
local resource_path = get_quarto_resource_path()
if resource_path == nil then
  vim.notify_once "quarto not found, lua library files not loaded"
else
  table.insert(lua_library_files, resource_path .. "/lua-types")
  table.insert(lua_plugin_paths, resource_path .. "/lua-plugin/plugin.lua")
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = ooo,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
