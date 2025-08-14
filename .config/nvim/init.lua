-- source vimrc before everything else
vim.cmd('source ~/.vimrc')

selected_theme = 'tokyonight-night' -- choose theme

-- setup vscode support if it's active
vscode = nil
local ok, _vscode = pcall(require, 'vscode')
if ok then vscode = _vscode end

-- import other settings, setup plugins
require('settings')
require('keybinds')
require('config.lazy')

vim.cmd('colorscheme ' .. selected_theme)

-- useful symbols
-- loading: ⠋, ⠙, ⠹, ⠸, ⠼, ⠴, ⠦, ⠧, ⠇, ⠏, ✓
