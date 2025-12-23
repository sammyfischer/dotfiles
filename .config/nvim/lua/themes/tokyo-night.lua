local themes = {
  ['tokyonight'] = true,
  ['tokyonight-night'] = true,
  ['tokyonight-storm'] = true,
  ['tokyonight-day'] = true,
}

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
    enable = themes[SelectedTheme] == true,
  },
}
