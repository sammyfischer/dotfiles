-- set leader key before everything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

selected_theme = 'carbonfox' -- choose theme

-- setup vscode support if it's active
vscode = nil
local ok, vsc = pcall(require, 'vscode')
if ok then vscode = vsc end

-- import other settings, setup plugins
require('settings')
require('keybinds')
require('config.lazy')

vim.cmd('colorscheme ' .. selected_theme)

-- when TERM_MODE is set, open a single term buffer
if vim.env.TERM_MODE then
  vim.cmd('terminal')
  vim.cmd('Neotree action=show source=buffers position=left')
end

-- useful symbols
-- loading: ⠋, ⠙, ⠹, ⠸, ⠼, ⠴, ⠦, ⠧, ⠇, ⠏, ✓
