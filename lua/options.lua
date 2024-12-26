require "nvchad.options"

-- disable snack animations
vim.g.snacks_animate = false
vim.o.relativenumber = true
vim.diagnostic.config { virtual_text = false }

vim.notify = Snacks.notifier
