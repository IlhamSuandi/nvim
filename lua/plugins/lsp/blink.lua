return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "supermaven-nvim",
    "saghen/blink.compat",
    -- "giuxtaposition/blink-cmp-copilot",
  },
  event = "VeryLazy",
  -- use a release tag to download pre-built binaries
  version = "*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = "enter" },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    signature = { enabled = true },
    completion = {
      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
        -- "copilot",
        "supermaven",
        "dadbod",
        "jupynium",
      },
      -- You can also extend the default sources
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
        },
        jupynium = {
          name = "jupynium",
          async = true,
          module = "blink.compat.source",
        },
        -- copilot = {
        --   name = "copilot",
        --   module = "blink-cmp-copilot",
        --   score_offset = 100,
        --   async = true,
        -- },
        supermaven = {
          name = "supermaven",
          score_offset = 100,
          async = true,
          module = "blink.compat.source",
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              item.kind_icon = '⚡'
              item.kind_name = 'supermaven'
            end
            return items
          end
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
