return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    opts = {},

    config = function()
      -- telescope keybinds
      local map = vim.keymap.set
      local builtin = require('telescope.builtin')

      -- general
      map('n', '<leader>tt', '<Cmd>Telescope<CR>', { desc = 'Open Telescope window' })
      map('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
      map('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
      map('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
      map('n', '<leader>th', builtin.command_history, { desc = 'Telescope command history' })
      map('n', '<leader>tq', builtin.quickfix, { desc = 'Telescope quick fix' })
      map('n', '<leader>tj', builtin.jumplist, { desc = 'Telescope jump list' })

      -- lsp
      map('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope lsp references' })
      map('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope lsp definition' })
    end,
  },
}
