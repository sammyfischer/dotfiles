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

-- moving windows
map('n', '<C-S-h>', '<C-w>H')
map('n', '<C-S-j>', '<C-w>J')
map('n', '<C-S-k>', '<C-w>K')
map('n', '<C-S-l>', '<C-w>L')

-- write buffer
map('n', '<leader>w', '<Cmd>w<CR>')
map('n', '<leader>W', '<Cmd>wa<CR>')

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
map({ 'n', 'x' }, 'ss', 's', { noremap = true })

-- exit terminal mode
map('t', '<C-\\>', '<C-\\><C-n>', { noremap = true })

-- focus neotree file explorer
map(
  'n',
  '<leader>e',
  '<Cmd>Neotree action=focus source=filesystem position=left<CR>',
  { desc = 'Open and focus Neotree filesystem' }
)

-- vscode specific keybinds
if vscode then
  -- format code
  map('n', '<leader>f', function()
    vscode.action('editor.action.formatDocument', { desc = 'VS Code format code' })
  end)

  -- rename symbol
  map(
    'n',
    '<leader>r',
    function()
      vscode.action('editor.action.rename')
    end,
    { desc = 'VS Code rename symbol' }
  )

  -- focus vscode file explorer instead of neotree
  map(
    'n',
    '<leader>e',
    function()
      vscode.call('workbench.view.explorer')
      vscode.call('workbench.files.action.focusFilesExplorer')
    end,
    { desc = 'VS Code open and focus file explorer' }
  )
end
