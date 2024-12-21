-- discord activity
  return {
    "IogaMaster/neocord",
    lazy = false,
    event = "VeryLazy",
    config = function()
      require "configs.discord"
    end,
  }
