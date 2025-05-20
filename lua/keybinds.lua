vim.keymap.set({ 'n', 'x' }, 'H', '^')  -- home
vim.keymap.set({ 'n', 'x' }, 'L', 'g_') -- end

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>w', ':w<CR>')  -- save
vim.keymap.set('n', '<leader>W', ':wa<CR>') -- save all

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
vim.keymap.set('n', 'ss', 's', { noremap = true })

-- vscode specific keybinds
if vscode then
  -- format code
  vim.keymap.set('n', '<leader>f', function()
    vscode.action('editor.action.formatDocument')
  end)

  -- rename symbol
  vim.keymap.set('n', '<leader>r', function()
    vscode.action('editor.action.rename')
  end)

  -- should bring up and focus the file explorer, but currently only brings it up if it's not visible
  vim.keymap.set('n', '<leader>e', function()
    vscode.action('workbench.files.action.focusFilesExplorer')
  end)
end
