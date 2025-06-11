return {
  'akinsho/git-conflict.nvim',
  version = "*",
  lazy = false,
  config = function()
    require 'git-conflict'.setup {
      default_mappings = {
        ours = 'o',
        theirs = 't',
        none = '0',
        both = 'b',
        next = 'n',
        prev = 'p',
      },
    }
  end
}
