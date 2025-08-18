return {
  'akinsho/git-conflict.nvim',
  version = "*",
  lazy = false,
  config = function()
    require 'git-conflict'.setup {
      default_mappings = {
        ours = '<leader>co',
        theirs = '<leader>ct',
        both = '<leader>ca',
      },
    }
  end
}
