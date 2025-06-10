return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,

    config = function()
      local map = vim.keymap.set
      local builtin = require('telescope.builtin')
      local action_state = require('telescope.actions.state')

      -- general
      map('n', '<leader>gt', '<Cmd>Telescope<CR>', { desc = 'Open Telescope window' })
      map('n', '<leader>gf', builtin.find_files, { desc = 'Telescope find files' })
      map('n', '<leader>gb', builtin.buffers, { desc = 'Telescope buffers' })
      map('n', '<leader>gh', builtin.command_history, { desc = 'Telescope command history' })
      map('n', '<leader>gq', builtin.quickfix, { desc = 'Telescope quick fix' })
      map('n', '<leader>gj', builtin.jumplist, { desc = 'Telescope jump list' })

      -- lsp
      map('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope lsp references' })
      map('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope lsp definition' })

      require('telescope').setup {
        pickers = {
          buffers = {
            mappings = {
              n = {
                ['d'] = function(_)
                  local entry = action_state.get_selected_entry()

                  --[[
                  e.g.
                  {
                    bufnr = 3,
                    display = <function 1>,
                    filename = "filename",
                    index = 1,
                    indicator = "#h  ",
                    lnum = 1,
                    ordinal = "3 : filename",
                    path = "full path",
                    <metatable> = {
                      __index = <function 2>
                    }
                  }
                  --]]

                  local target_bufnr = entry.bufnr
                  vim.cmd('bd ' .. target_bufnr)
                end,
              },
            },
          },
        },
      }
    end,
  },
}
