-- NOTE : completion
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  lazy = true,
  dependencies = {
    "hrsh7th/cmp-cmdline",
    {
      "supermaven-inc/supermaven-nvim",
      build = ":SupermavenUseFree", -- remove this line if you are using pro
      opts = {
        log_level = "off", -- set to "off" to disable logging completely
      },
    },
  },
  opts = function()
    return require "configs.custom_cmp"
  end,
}
