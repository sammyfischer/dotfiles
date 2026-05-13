return {
  {
    'echasnovski/mini.nvim',
    version = false,

    config = function()
      require('mini.ai').setup()

      if not Vscode then
        require('mini.icons').setup()
        require('mini.indentscope').setup { symbol = '│' }
      end

      require('mini.move').setup()
      require('mini.pairs').setup()

      -- remove default behavior for 's'
      vim.keymap.del({ 'n', 'x' }, 's')
      require('mini.surround').setup()
      -- just use 's' to add surround in visual mode
      vim.keymap.set('x', 's', [[:<c-u>lua MiniSurround.add('visual')<cr>]], { silent = true })
      -- surround line
      vim.keymap.set('n', 'ss', [[:<c-u>lua MiniSurround.add('normal')<cr>]], { silent = true, noremap = true })
    end,
  },
}
