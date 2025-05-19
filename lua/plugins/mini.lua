return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      -- mini.nvim modules need to be enabled individually
      require('mini.ai').setup()
      require('mini.completion').setup()
      require('mini.icons').setup()
      require('mini.indentscope').setup { symbol = '│' }
      require('mini.move').setup()
      require('mini.pairs').setup()
      require('mini.snippets').setup()
      require('mini.splitjoin').setup()
      require('mini.surround').setup()
      require('mini.tabline').setup()
    end,
  },
}
