local map = vim.keymap.set

local function noremap(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  vim.keymap.set(modes, lhs, rhs, opts)
end

noremap({ 'n', 'x', 'o' }, 'H', 'g^') -- home
noremap({ 'n', 'x', 'o' }, 'L', 'g$') -- end

-- use x to cut
noremap({ 'n', 'x' }, 'X', 'x') -- X to delete char
noremap({ 'n', 'x' }, 'x', 'd') -- x does what d used to do
noremap('n', 'xx', 'dd')        -- cut entire line

-- make d not copy
noremap({ 'n', 'x' }, 'd', '"_d')
noremap({ 'n', 'x' }, 'D', '"_D')

-- make c not copy
noremap({ 'n', 'x' }, 'c', '"_c')
noremap({ 'n', 'x' }, 'C', '"_C')

-- make pasting in visual mode not copy selection
noremap('x', 'p', '"_dP')

-- make Y yank and keep visual mode selection
noremap('x', 'Y', 'ygv')

-- window navigation
noremap('n', '<C-h>', '<C-w>h')
noremap('n', '<C-j>', '<C-w>j')
noremap('n', '<C-k>', '<C-w>k')
noremap('n', '<C-l>', '<C-w>l')

-- moving windows
noremap('n', '<C-S-h>', '<C-w>H')
noremap('n', '<C-S-j>', '<C-w>J')
noremap('n', '<C-S-k>', '<C-w>K')
noremap('n', '<C-S-l>', '<C-w>L')

-- tab navigation
map('n', '<Tab>', '<Cmd>tabnext<CR>')
map('n', '<S-Tab>', '<Cmd>tabprev<CR>')

-- write buffer
map('n', '<leader>w', '<Cmd>w<CR>')
map('n', '<leader>W', '<Cmd>wa<CR>')

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
noremap({ 'n', 'x' }, 'ss', 's')

-- exit terminal mode
noremap('t', '<C-\\>', '<C-\\><C-n>')

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
