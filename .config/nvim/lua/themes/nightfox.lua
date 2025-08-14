local themes = {
  ['nightfox'] = true,
  ['dayfox'] = true,
  ['dawnfox'] = true,
  ['duskfox'] = true,
  ['nordfox'] = true,
  ['terafox'] = true,
  ['carbonfox'] = true,
}

return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    enable = themes[selected_theme] == true,
  },
}
