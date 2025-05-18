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
            ensure_installed = { 'lua_ls', 'volar', 'ts_ls' },
        },
    },

    {
      'neovim/nvim-lspconfig',
      lazy = false,
    }
}
