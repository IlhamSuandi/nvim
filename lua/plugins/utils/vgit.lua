return {
  "tanvirtin/vgit.nvim",
  branch = "v1.0.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  keys = {
    {
      "<leader>gk",
      function()
        require("vgit").hunk_up()
      end,

      desc = "Go Up Hunk",
      mode = "n",
    },
    {
      "<leader>gj",
      function()
        require("vgit").hunk_down()
      end,
      desc = "Go Down Hunk",
      mode = "n",
    },
    {
      "<leader>gs",
      function()
        require("vgit").project_stash_preview()
      end,
      desc = "project stash preview",
      mode = "n",
    },
    {
      "<leader>gp",
      function()
        require("vgit").buffer_diff_preview()
      end,
      desc = "diff preview",
      mode = "n",
    },
    {
      "<leader>gh",
      function()
        require("vgit").buffer_history_preview()
      end,
      desc = "history preview",
      mode = "n",
    },
    {
      "<leader>gd",
      function()
        require("vgit").project_diff_preview()
      end,
      desc = "project diff preview",
      mode = "n",
    },
  },
  opts = {
    settings = {
      live_blame = {
        enabled = false,
      },
    },
  },
  config = function(_, opts)
    require("vgit").setup(opts)
  end,
}
