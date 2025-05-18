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

--[[
check if vscode-neovim is being used

useful editor actions:
editor.action.formatDocument
editor.action.commentLine
workbench.action.navigateBack / ...Forward

example:
vscode.action('editor.action.commentLine')

vscode actions:
vscode.action() - async
vscode.call(name, opts, timeout) - sync

notificatiions:
vscode.notify(msg) - send actual vscode notification
vim.notify = vscode.notify - sets vscode's notifications to be the default
--]]
local ok, vsc = pcall(require, 'vscode')
if ok then
    vsc.notify('Loading VSCode config')
else
    vsc = nil
end
vscode = vsc -- expose as global

require('keybinds')                   -- set keybinds in ./lua/keybinds.lua
require('config.lazy')                -- most plugin/theme related things should be done after this

vim.cmd('colorscheme ' .. selected_theme)

-- language server setup
