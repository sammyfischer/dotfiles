local map = vim.keymap.set

local function noremap(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  vim.keymap.set(modes, lhs, rhs, opts)
end

local function cmd(command)
  return '<Cmd>' .. command .. '<CR>'
end

local function wincmd(command)
  return '<Cmd>wincmd ' .. command .. '<CR>'
end

-- for commands that take a count, but use that count as the first arg passed
local function countcmd(command)
  return function()
    if vim.v.count == 0 then
      vim.cmd(command)
    else
      vim.cmd(command .. ' ' .. vim.v.count)
    end
  end
end

noremap({ 'n', 'x', 'o' }, 'H', '^') -- home
noremap({ 'n', 'x', 'o' }, 'L', '$') -- end

-- use x to cut
noremap({ 'n', 'x' }, 'X', 'x', { desc = 'Delete character' }) -- X to delete char
noremap({ 'n', 'x' }, 'x', 'd', { desc = 'Cut' })              -- x does what d used to do
noremap('n', 'xx', 'dd', { desc = 'Cut line' })                -- cut entire line

-- make d not copy
noremap({ 'n', 'x' }, 'd', '"_d')
noremap({ 'n', 'x' }, 'D', '"_D')

-- make c not copy
noremap({ 'n', 'x' }, 'c', '"_c')
noremap({ 'n', 'x' }, 'C', '"_C')

-- make pasting in visual mode not copy selection
noremap('x', 'p', '"_dP')

-- yank without losing visual mode selection
noremap('x', 'Y', 'ygv', { desc = 'Yank (keep selection)' })

-- window commands
map('n', '<leader>q', cmd 'q', { desc = 'Window: quit' })
map('n', '<leader>Q', cmd 'qa', { desc = 'Window: quit all' })
map('n', '<leader>ws', cmd 'split', { desc = 'Window: split' })
map('n', '<leader>wv', cmd 'vsplit', { desc = 'Window: vsplit' })
map('n', '<leader>wt', cmd 'wincmd T', { desc = 'Window: open in new tab' })

-- window navigation
noremap('n', '<C-h>', wincmd 'h', { desc = 'Window: navigate left' })
noremap('n', '<C-j>', wincmd 'j', { desc = 'Window: navigate down' })
noremap('n', '<C-k>', wincmd 'k', { desc = 'Window: navigate up' })
noremap('n', '<C-l>', wincmd 'l', { desc = 'Window: navigate right' })

-- window arrangement
noremap('n', '<leader>wh', wincmd 'H', { desc = 'Window: move left' })
noremap('n', '<leader>wj', wincmd 'J', { desc = 'Window: move down' })
noremap('n', '<leader>wl', wincmd 'K', { desc = 'Window: move up' })
noremap('n', '<leader>wl', wincmd 'L', { desc = 'Window: move right' })

-- tab commands
map('n', '<leader>tq', countcmd 'tabclose', { desc = 'Tab: close (accepts count)' })
map('n', '<leader>tn', cmd 'tabnew', { desc = 'Tab: new' })

-- tab navigation
map('n', '<Tab>', cmd 'tabnext', { desc = 'Tab: next' })
map('n', '<S-Tab>', cmd 'tabprev', { desc = 'Tab: prev' })
map('n', '<leader>tt', countcmd('tabnext'), { desc = 'Tab: next (accepts count)' })

-- tab arrangement
map('n', '<leader>th', cmd '-tabmove', { desc = 'Tab: swap left' })
map('n', '<leader>tl', cmd '+tabmove', { desc = 'Tab: swap right' })

-- buffer commands
map('n', '<leader>s', cmd 'w', { desc = 'Buffer: write' })
map('n', '<leader>S', cmd 'wa', { desc = 'Buffer: write all' })
map('n', '<leader>bd', countcmd 'bd', { desc = 'Buffer: delete (accepts count)' })

-- buffer navigation
map('n', '[<Tab>', cmd 'bprev', { desc = 'Buffer: prev' })
map('n', ']<Tab>', cmd 'bnext', { desc = 'Buffer: next' })

-- scroll keybinds
noremap('n', 'zj', '<C-d>', { desc = 'Move down half page' })
noremap('n', 'zk', '<C-u>', { desc = 'Move up half page' })

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
noremap({ 'n', 'x' }, 'ss', 's')

-- exit terminal mode
noremap('t', '<C-\\>', '<C-\\><C-n>')

-- focus neotree file explorer
map(
  'n',
  '<leader>e',
  cmd 'Neotree action=focus source=filesystem position=left',
  { desc = 'Focus file explorer' }
)

-- vscode specific keybinds
if vscode then
  -- format code
  map(
    'n',
    '<leader>f',
    function()
      vscode.action('editor.action.formatDocument', { desc = 'VS Code format code' })
    end,
    { desc = 'Format document' }
  )

  -- rename symbol
  map(
    'n',
    '<leader>r',
    function()
      vscode.action('editor.action.rename')
    end,
    { desc = 'Rename symbol' }
  )

  -- focus vscode file explorer instead of neotree
  map(
    'n',
    '<leader>e',
    function()
      vscode.call('workbench.view.explorer')
      vscode.call('workbench.files.action.focusFilesExplorer')
    end,
    { desc = 'Focus file explorer' }
  )

  map(
    'n',
    '<Tab>',
    function()
      vscode.action('workbench.action.nextEditor')
    end,
    { desc = 'Next tab' }
  )

  map(
    'n',
    '<S-Tab>',
    function()
      vscode.action('workbench.action.previousEditor')
    end,
    { desc = 'Prev tab' }
  )
end
