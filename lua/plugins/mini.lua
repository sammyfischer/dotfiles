return {
  {
    'echasnovski/mini.nvim',
    version = false,

    config = function()
      -- mini.nvim modules need to be enabled individually
      require('mini.ai').setup()
      -- require('mini.completion').setup()
      require('mini.icons').setup()

      if not vscode then
        require('mini.indentscope').setup { symbol = '│' }
      end

      require('mini.move').setup()
      require('mini.pairs').setup()
      -- require('mini.snippets').setup()

      require('mini.splitjoin').setup {
        mappings = {
          toggle = 'gs',
          join = 'gj',
          split = 'gS',
        },
      }
      require('mini.surround').setup()
    end,
  },
}
