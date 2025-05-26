return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false, -- neo-tree will lazily load itself

    opts = {

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

      source_selector = {
        winbar = true,
        statusline = false,
      },
    },

    config = function()
      -- in terminal mode, only show buffers
      local opts = {}

      opts.sources = { 'filesystem', 'buffers', 'git_status' }
      if vim.env.TERM_MODE then
        -- in term mode, only use buffers source
        opts.sources = { 'buffers' }
        opts.default_source = 'buffers'
      else
        -- not in term mode, we can configure the filesystem source
        opts.filesystem = {
          filtered_items = {
            visible = true,
            hide_gitignored = true,
            hide_dotfiles = false,
            hide_hidden = false,
            never_show = {
              '.DS_Store',
              'thumbs.db',
            },
          },

        }
      end

      require('neo-tree').setup(opts)
    end,
  },
}
