return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = selected_theme,
      sections = {
        lualine_x = { 'lsp_status', 'filetype' },
        lualine_y = { 'selectioncount' },
      },
      extensions = { 'neo-tree', 'lazy', 'mason' },
    },
  },
}
