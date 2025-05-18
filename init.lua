-- basic settings
vim.o.number = true
vim.o.scrolloff = 5
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.o.background = 'dark' -- used by some themes to set dark/light mode

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

selected_theme = 'tokyonight-night' -- set theme name here

vscode = nil
local ok, vsc = pcall(require, 'vscode')
if ok then vscode = vsc end

require('keybinds')    -- set keybinds in ./lua/keybinds.lua
require('config.lazy') -- most plugin/theme related things should be done after this

vim.cmd('colorscheme ' .. selected_theme)
