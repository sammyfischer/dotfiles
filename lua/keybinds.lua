-- move to beginning/end of line
vim.keymap.set({ 'n', 'x' }, 'H', '^')
vim.keymap.set({ 'n', 'x' }, 'L', 'g_')

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- vscode specific keybinds
if vscode then
  vim.keymap.set('n', '<leader>f', function() vscode.action('editor.action.formatDocument') end)
  vim.keymap.set('n', '<leader>e', function() vscode.action('workbench.files.action.focusFilesExplorer') end)
end
