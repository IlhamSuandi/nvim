return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  enabled = false,
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        -- accept = "<Tab>", -- handled by nvim-cmp / blink.cmp
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
  },
}
