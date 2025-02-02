require "nvchad.options"

-- disable snack animations
vim.g.snacks_animate = false
vim.o.relativenumber = true
vim.diagnostic.config { virtual_text = false }

vim.notify = Snacks.notifier

vim.opt.wrap = false -- Disable line wrap

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_python3_provider = 1
