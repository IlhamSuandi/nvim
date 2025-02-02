-- database things
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    { "tpope/vim-dotenv", lazy = false },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_env_variable_url = "DB_URL"
    vim.g.db_ui_dotenv_variable_prefix = "DB_UI_"
  end,
  keys = {
    { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Open Database UI" },
  },
}
