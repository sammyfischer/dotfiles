local filename = {
  'filename',
  newfile_status = true,
  symbols = {
    modified = '[]', -- 󰏫, 󰷫
    readonly = '[]', -- , 󰷪, 󰏯, 󰷭
  },
}

local buffers = {
  'buffers',
  symbols = {
    modified = ' []',
  },
}

local tabs = {
  'tabs',
  mode = 1,
  symbols = {
    modified = '[]',
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
      theme = selected_theme,

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { filename },

        lualine_x = { 'lsp_status', 'filetype' },
        lualine_y = { 'selectioncount' },
        lualine_z = { 'location' },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename },

        lualine_x = {
          { 'filetype', colored = false },
          'location',
        },

        lualine_y = {},
        lualine_z = {},
      },

      tabline = {
        lualine_a = {},
        lualine_b = { tabs },
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { buffers },

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      extensions = { 'neo-tree', 'lazy', 'mason' },
    },
  },
}
