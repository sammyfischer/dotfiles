local M = {}

if vim.env.OBSIDIAN then
  M = {
    'epwalsh/obsidian.nvim',
    lazy = true,
    ft = 'markdown',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
    },

    opts = {
      workspaces = {
        {
          name = 'main',
          path = '~/obsidian-vault',
        },
      },
    },
  }
end

return M
