-- load the session for the current directory
Keymap("n", "<leader>qs", function()
  require("persistence").load()
end, Keymap_opts "load session")

-- select a session to load
Keymap("n", "<leader>qS", function()
  require("persistence").select()
end, Keymap_opts "select session")

-- load the last session
Keymap("n", "<leader>ql", function()
  require("persistence").load { last = true }
end, Keymap_opts "load last session")

-- stop Persistence => session won't be saved on exit
Keymap("n", "<leader>qd", function()
  require("persistence").stop()
end, Keymap_opts "stop Persistence")

-- quit all the sessions
Keymap("n", "<leader>qq", "<cmd>qall<cr>", Keymap_opts "quit all")
