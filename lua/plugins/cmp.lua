return {
  -- snippet engine
  { 'L3MON4D3/LuaSnip' },

  -- cmp luasnip compatibility plugin
  { 'saadparwaiz1/cmp_luasnip' },

  -- completion sources
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },

  -- completion
  {
    'hrsh7th/nvim-cmp',

    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup {

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          ['<C-Space>'] = cmp.mapping.complete(),
          ['<S-Esc>'] = cmp.mapping.abort(),

          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end),

          -- move down in completion list
          ['<C-j>'] = cmp.mapping(function(fallback)
                                    if cmp.visible() then
                                      cmp.select_next_item()
                                    elseif luasnip.locally_jumpable(1) then
                                      luasnip.jump(1)
                                    else
                                      fallback()
                                    end
                                  end,
                                  { 'i', 's' }),

          -- move up in completion list
          ['<C-k>'] = cmp.mapping(function(fallback)
                                    if cmp.visible() then
                                      cmp.select_prev_item()
                                    elseif luasnip.locally_jumpable(-1) then
                                      luasnip.jump(-1)
                                    else
                                      fallback()
                                    end
                                  end,
                                  { 'i', 's' }),
        }),

        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }

      -- use words in buffer for search completion
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      -- set up cmdline completion
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = 'path' } },
          { { name = 'cmdline' } }
        ),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
