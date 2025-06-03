local ensure_installed = {
  'bashls',
  'lua_ls',
  'pyright',
  'ts_ls',
  'vue_ls',
}

local on_attach = function(args)
  -- if vscode-neovim is active then vscode's editor actions will be used instead
  if not vscode then
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

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ bufnr = args.buf })
      end,
    })
  end
end

vim.diagnostic.config({
  virtual_text = true,
})

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
        settings = { Lua = { workspace = { library = { vim.fn.expand('$VIMRUNTIME/lua') } } } },
      })
    end,
  },
}
