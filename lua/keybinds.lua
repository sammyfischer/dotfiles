local map = vim.keymap.set

map({ 'n', 'x' }, 'H', '^')  -- home
map({ 'n', 'x' }, 'L', 'g_') -- end

-- better copy/paste
map({ 'n', 'x' }, 'X', 'x', { noremap = true })   -- change x to X
map({ 'n', 'x' }, 'd', '"_d', { noremap = true }) -- d deletes w/o copying
map({ 'n', 'x' }, 'x', '"*d', { noremap = true }) -- x to cut
map('n', 'xx', '"*dd', { noremap = true })        -- xx to cut line

-- window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<leader>w', '<Cmd>w<CR>')  -- save
map('n', '<leader>W', '<Cmd>wa<CR>') -- save all

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
map({ 'n', 'x' }, 'ss', 's', { noremap = true })

map('t', '<C-\\><C-\\>', '<C-\\><C-n>') -- exit terminal mode

-- vscode specific keybinds
if vscode then
  -- format code
  map('n', '<leader>f', function()
    vscode.action('editor.action.formatDocument')
  end)

  -- rename symbol
  map('n', '<leader>r', function()
    vscode.action('editor.action.rename')
  end)

  -- should bring up and focus the file explorer, but currently only brings it up if it's not visible
  map('n', '<leader>e', function()
    vscode.action('workbench.files.action.focusFilesExplorer')
  end)
end
