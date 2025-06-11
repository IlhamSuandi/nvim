return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    cleanup_delay_ms = 100,
    prompt_save_on_select_new_entry = false,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    },
    preview_win = {
      update_on_cursor_moved = true,
      disable_preview = function(filename)
        return false
      end,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  setup = function(_, opts)
    require("oil").setup(opts)
  end,
}
