return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require "harpoon"

    local keys = {
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>hh",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-P>",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon Previous",
      },
      {
        "<C-N>",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon Next",
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<leader>h" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
