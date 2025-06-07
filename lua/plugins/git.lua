return {
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>',
    },
  },
  {
    'sindrets/diffview.nvim',
  },
}
