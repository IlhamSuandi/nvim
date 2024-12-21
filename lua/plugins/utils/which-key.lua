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
        { "<leader>sn", group = "Search Notifications" },
        { "<leader>h", group = "Harpoon" },
      },
    }
  end,
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
