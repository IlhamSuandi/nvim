-- Notifications
return {
  "folke/noice.nvim",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
    routes = {
      {
        filter = {
          event = { "notify" },
          find = "No information available",
        },
        opts = { skip = true },
      },
    },
  },
  keys = {
    { "<leader>sn", "", desc = "+noice" },
    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c",
      desc = "Redirect Cmdline",
    },
    {
      "<leader>snl",
      function()
        require("noice").cmd "last"
      end,
      desc = "Noice Last Message",
    },
    {
      "<leader>snh",
      "<cmd>Noice telescope<cr>",
      desc = "Noice History",
    },
    {
      "<leader>sna",
      function()
        require("noice").cmd "all"
      end,
      desc = "Noice All",
    },
    {
      "<leader>snd",
      function()
        require("noice").cmd "dismiss"
      end,
      desc = "Dismiss All",
    },
    {
      "<leader>snt",
      function()
        require("noice").cmd "pick"
      end,
      desc = "Noice Picker (Telescope/FzfLua)",
    },
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Forward",
      mode = { "i", "n", "s" },
    },
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Backward",
      mode = { "i", "n", "s" },
    },
  },
  config = function(_, opts)
    -- HACK: noice shows messages from before it was enabled,
    -- but this is not ideal when Lazy is installing plugins,
    -- so clear the messages in this case.
    if vim.o.filetype == "lazy" then
      vim.cmd [[messages clear]]
    end
    require("noice").setup(opts)
  end,
}
