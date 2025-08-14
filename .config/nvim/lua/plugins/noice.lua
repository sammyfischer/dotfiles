return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',

    dependencies = {
      'MunifTanjim/nui.nvim',
    },

    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },

      presets = {
        long_message_to_split = true,
        lsp_doc_border = true,
      },

      cmdline = {
        format = {
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
        },
      },

      messages = {
        enabled = false,
      },
    },
  },
}
