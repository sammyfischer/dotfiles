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


-- window size
noremap('n', '<C-S-h>', cmd 'vertical resize -3', { desc = 'Window: shrink horizontally' })
noremap('n', '<C-S-l>', cmd 'vertical resize +3', { desc = 'Window: grow horizontally' })
noremap('n', '<C-S-j>', cmd 'resize -1', { desc = 'Window: shrink vertically' })
noremap('n', '<C-S-k>', cmd 'resize +1', { desc = 'Window: grow vertically' })

-- tab commands
noremap('n', '<leader>tq', countcmd 'tabclose', { desc = 'Tab: close (accepts count)' })
noremap('n', '<leader>tn', cmd 'tabnew', { desc = 'Tab: new' })
noremap('n', '<leader>wt', wincmd 'T', { desc = 'Open window in new tab' })

-- tab navigation
noremap('n', ']<Tab>', cmd 'tabnext', { desc = 'Tab: next' })
noremap('n', '[<Tab>', cmd 'tabprev', { desc = 'Tab: prev' })
noremap('n', '<leader>tt', countcmd 'tabnext', { desc = 'Tab: next (accepts count)' })

-- tab arrangement
noremap('n', '<leader>th', cmd '-tabmove', { desc = 'Tab: swap left' })
noremap('n', '<leader>tl', cmd '+tabmove', { desc = 'Tab: swap right' })

-- mini.surround uses s as its first keystroke, so s for substitute requires you to wait a bit.
-- this keymap allows you to just press it twice instead of waiting
noremap({ 'n', 'x' }, 'ss', 's')

-- focus neotree file explorer
noremap(
  'n',
  '<leader>e',
  cmd 'Neotree action=focus source=filesystem',
  { desc = 'Focus file explorer' }
)

noremap('n', 'gs', cmd 'TSJToggle', { desc = 'Splitjoin toggle' })
noremap('n', 'gj', cmd 'TSJJoin', { desc = 'Splitjoin join' })
noremap('n', 'gS', cmd 'TSJSplit', { desc = 'Splitjoin split' })

-- vscode specific keybinds
if Vscode then
  -- format code
  map(
    'n',
    '<leader>f',
    function()
      Vscode.action('editor.action.formatDocument', { desc = 'VS Code format code' })
    end,
    { desc = 'Format document' }
  )

  -- rename symbol
  map(
    'n',
    '<leader>r',
    function()
      Vscode.action('editor.action.rename')
    end,
    { desc = 'Rename symbol' }
  )

  -- focus vscode file explorer instead of neotree
  map(
    'n',
    '<leader>e',
    function()
      -- call is synchronous
      Vscode.call('workbench.view.explorer')
      Vscode.call('workbench.files.action.focusFilesExplorer')
    end,
    { desc = 'Focus file explorer' }
  )

  map(
    'n',
    '<Tab>',
    function()
      Vscode.action('workbench.action.nextEditor')
    end,
    { desc = 'Next tab' }
  )

  map(
    'n',
    '<S-Tab>',
    function()
      Vscode.action('workbench.action.previousEditor')
    end,
    { desc = 'Prev tab' }
  )

  map(
    'n',
    '<leader>q',
    function()
      Vscode.action('workbench.action.closeActiveEditor')
    end,
    { desc = 'Close tab' }
  )

  map(
    'n',
    '<leader>o',
    function()
      Vscode.action('editor.action.organizeImports')
    end,
    { desc = 'Organize imports' }
  )
end
