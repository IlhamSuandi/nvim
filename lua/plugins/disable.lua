local function disable(plugins)
  local disabled_plugins = {}
  for _, plugin in ipairs(plugins) do
    table.insert(disabled_plugins, { plugin, enabled = false })
  end

  return disabled_plugins
end

return disable({
  -- completion
  -- "saghen/blink.cmp",

  -- statusline on bottom
  "nvim-lualine/lualine.nvim",

  -- ai thing
  "yetone/avante.nvim",

  -- leetcode
  "kawre/leetcode.nvim",

  -- lsp preview things
  -- "nvimdev/lspsaga.nvim",

  -- inline diagnostic
  -- "rachartier/tiny-inline-diagnostic.nvim",

  -- image support
  -- "3rd/image.nvim",

  -- themes switcher
  "zaldih/themery.nvim",
})
