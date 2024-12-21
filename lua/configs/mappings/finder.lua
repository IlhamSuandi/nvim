-- telescope
Keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", Keymap_opts "telescope live grep")
Keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", Keymap_opts "telescope find buffers")
Keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", Keymap_opts "telescope help page")
Keymap("n", "<leader>fm", "<cmd>Telescope marks<CR>", Keymap_opts "telescope find marks")
Keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", Keymap_opts "telescope find oldfiles") Keymap(
  "n",
  "<leader>fz",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  Keymap_opts "telescope find in current buffer"
)
Keymap("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", Keymap_opts "telescope git commits")
Keymap("n", "<leader>fs", "<cmd>Telescope git_status<CR>", Keymap_opts "telescope git status")
Keymap("n", "<leader>ft", "<cmd>Telescope terms<CR>", Keymap_opts "telescope pick hidden term")
Keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", Keymap_opts "telescope find files")
Keymap(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  Keymap_opts "telescope find all files"
)
Keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", Keymap_opts "telescope diagnostics")
Keymap("n", "<leader>fq", "<cmd>copen<CR>", Keymap_opts "Open Quickfix")
Keymap("n", "<leader>ft", "<cmd>Telescope git_files<CR>", Keymap_opts "Open Quickfix")
