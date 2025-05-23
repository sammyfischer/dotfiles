local on_attach = function(_, buf)
  -- for vscode, <leader>f calls the vscode format action
  if not vscode then
    vim.keymap.set('n', '<leader>f', function()
                     vim.lsp.buf.format()
                   end, { buffer = buf })
  end
end

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
    opts = {
      ensure_installed = { 'lua_ls', 'vue_ls', 'ts_ls' }
    }
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          on_attach(_, args.buf)
        end,
      })

      vim.lsp.config('lua_ls', {
        settings = { Lua = { workspace = { library = { vim.fn.expand('$VIMRUNTIME/lua') } } } },
      })
    end,
  },
}
