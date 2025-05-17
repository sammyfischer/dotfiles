-- basic settings
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.opt.clipboard = 'unnamedplus'

-- keymaps
vim.keymap.set({ 'n', 'x' }, 'H', '^')
vim.keymap.set({ 'n', 'x' }, 'L', 'g_')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy') -- lazy.nvim setup in ./lua/plugins

-- mini.nvim plugins
require('mini.ai').setup()
require('mini.completion').setup()
require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.snippets').setup()
require('mini.splitjoin').setup()
require('mini.surround').setup()

-- theme
vim.cmd[[colorscheme tokyonight-night]]

-- use lualine with tokyonight theme
require('lualine').setup {
    options = {
        theme = 'tokyonight-night'
    }
}
