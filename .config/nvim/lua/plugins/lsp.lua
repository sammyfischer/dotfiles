local ensure_installed = {
  'bashls',
  'eslint',
  'jsonls',
  'lua_ls',
  'pyright',
  'ts_ls',
  'vue_ls',
  'yamlls',
}

local function on_attach(args)
  vim.keymap.set(
    'n',
    '<leader>f',
    function()
      vim.lsp.buf.format({ bufnr = args.buf })
    end,
    {
      buffer = args.buf,
      desc = 'Format document',
    }
  )

  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {
    buffer = args.buf,
    desc = 'Rename symbol',
  })

  if vim.lsp.client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ bufnr = args.buf })
      end,
    })
  end
end

if Vscode then
  -- just use vscode for language server features instead
  return {}
else
  return {
    {
      'mason-org/mason.nvim',
      cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
      lazy = false,
      opts = {},
    },

    {
      'mason-org/mason-lspconfig.nvim',
      lazy = false,
      opts = { ensure_installed = ensure_installed },
    },

    {
      'neovim/nvim-lspconfig',
      lazy = false,

      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            on_attach(args)
          end,
        })

        vim.lsp.config('lua_ls', {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
                path = vim.fn.expand('$VIMRUNTIME/lua'),
              },

              workspace = {
                library = vim.fn.expand('~/.local/share/nvim/lazy'),
              },

              diagnostics = {
                globals = { 'vim' },
              },

              telemetry = {
                enable = false,
              },
            },
          },
        })

        vim.lsp.config('jsonls', {
          settings = {
            json = {
              format = {
                enable = true,
              },
              schemaDownload = {
                enable = true,
              },
            },
          },
        })
      end,
    },
  }
end
