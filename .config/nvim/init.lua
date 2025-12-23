-- source vimrc before everything else
vim.cmd('source ~/.vimrc')

_G.SelectedTheme = 'tokyonight-night' -- choose theme

-- vscode nvim support plugin
_G.Vscode = nil
local ok, _vscode = pcall(require, 'vscode')
if ok then Vscode = _vscode end

-- import other settings, setup plugins
require('settings')
require('keybinds')
require('config.lazy')

vim.cmd('colorscheme ' .. SelectedTheme)

-- useful symbols
-- loading: ⠋, ⠙, ⠹, ⠸, ⠼, ⠴, ⠦, ⠧, ⠇, ⠏, ✓
