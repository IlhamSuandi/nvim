return {
  "supermaven-inc/supermaven-nvim",
  event = "VeryLazy",
  build = ":SupermavenUseFree", -- remove this line if you are using pro
  config = function()
    require("supermaven-nvim").setup {
      keymaps = {
        accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
        accept_word = "<C-y>",
      },
      log_level = "off", -- set to "off" to disable logging completely
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false, -- disables built in keymaps for more manual control
    }
  end,
}
