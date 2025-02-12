local function disable(plugins)
  local disabled_plugins = {}
  for _, plugin in ipairs(plugins) do
    table.insert(disabled_plugins, { plugin, enabled = false })
  end

  return disabled_plugins
end

return disable {
  "3rd/image.nvim",
  "folke/noice.nvim",
  "hkupty/iron.nvim",
  "kiyoon/jupynium.nvim",
  "hrsh7th/nvim-cmp",
  "mfussenegger/nvim-dap",
  "nvim-telescope/telescope.nvim",
}
