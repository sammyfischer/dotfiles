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
map('n', '<leader>tt', countcmd 'tabnext', { desc = 'Tab: next (accepts count)' })

-- tab arrangement
map('n', '<leader>th', cmd '-tabmove', { desc = 'Tab: swap left' })
map('n', '<leader>tl', cmd '+tabmove', { desc = 'Tab: swap right' })

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
noremap({ 'n', 'x' }, 'ss', 's')

-- focus neotree file explorer
map(
  'n',
  '<leader>e',
  cmd 'Neotree action=focus source=filesystem',
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
      -- call is synchronous
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

  map(
    'n',
    '<leader>q',
    function()
      vscode.action('workbench.action.closeActiveEditor')
    end,
    { desc = 'Close tab' }
  )

  map(
    'n',
    '<leader>o',
    function()
      vscode.action('editor.action.organizeImports')
    end,
    { desc = 'Organize imports' }
  )
end
