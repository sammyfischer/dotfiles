return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- { "3rd/image.nvim", opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself

    opts = {

      filesystem = {
        filtered_items = {
          visible = true,
          hide_gitignored = true,
          hide_dotfiles = false,
          hide_hidden = false,
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            '.DS_Store',
            'thumbs.db',
          },
        },
      },

      close_if_last_window = false,
      default_component_configs = {
        name = {
          use_git_status_colors = false,
        },

        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
      },
    },

    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true,
            hide_gitignored = true,
            hide_dotfiles = false,
            hide_hidden = false,
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              '.DS_Store',
              'thumbs.db',
            },
          },
        },
      }

      if vscode then
        vim.keymap.set('n', '<leader>e', function()
          vscode.call('workbench.files.action.focusFilesExplorer')
          vscode.call('workbench.view.explorer')
        end)
      else
        vim.keymap.set('n', '<leader>e', ':Neotree action=focus source=filesystem position=left<CR>')
      end
    end,
  },
}
