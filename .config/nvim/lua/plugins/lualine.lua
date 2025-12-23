local filetype_names = {
  ['neo-tree'] = 'NeoTree',
  TelescopePrompt = 'Telescope',
  help = 'Help',
}

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
  mode = 4, -- name and number
  filetype_names = filetype_names,
  use_mode_colors = true,
  symbols = {
    modified = ' []',
  },
}

local tabs = {
  'tabs',
  mode = 2,                   -- name and number
  max_length = vim.o.columns, -- take the entire tabline
  filetype_names = filetype_names,
  use_mode_colors = true,
  symbols = {
    modified = '[]',
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
      options = {
        theme = SelectedTheme,
        disabled_filetypes = { winbar = { 'neo-tree' } },
        globalstatus = true,
      },

      extensions = { 'neo-tree', 'lazy', 'mason' },

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
        lualine_a = { tabs },
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      winbar = {
        lualine_a = {},
        lualine_b = { buffers },
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
