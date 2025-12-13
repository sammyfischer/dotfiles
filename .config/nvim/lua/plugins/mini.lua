return {
  {
    'echasnovski/mini.nvim',
    version = false,

    config = function()
      require('mini.ai').setup()
      require('mini.icons').setup()

      if not vscode then
        require('mini.indentscope').setup { symbol = '│' }
      end

      require('mini.move').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()
    end,
  },
}
