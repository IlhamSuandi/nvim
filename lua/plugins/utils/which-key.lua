-- to show keymaps
return {
  "folke/which-key.nvim",
  opts = function()
    local icon = require("nvim-web-devicons").get_icon
    return {
      preset = "helix",
      spec = {
        { "<leader>b", group = "Buffers", icon = icon "o" },
        { "<leader>f", group = "Finder" },
        { "<leader>c", group = "Code" },
        { "<leader>g", group = "Git" },
        { "<leader>u", group = "UI" },
        { "<leader>q", group = "Session" },
        { "<leader>s", group = "Search" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>d", group = "Debug" },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "<leader>s", group = "search" },
        { "<leader>sn", group = "notifications" },
      },
    }
  end,
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
