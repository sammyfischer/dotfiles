vim.o.number = true
vim.o.clipboard = 'unnamedplus'

-- tabbing
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- line visibility
vim.o.wrap = false
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- cosmetic
vim.o.termguicolors = true
vim.o.background = 'dark' -- used by some themes to set dark/light mode

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank({ timeout = 400 })
  end,
})

-- set default shell
if vim.loop.os_uname().sysname == 'Windows_NT' then
  -- powershell on windows
  vim.o.shell = 'powershell.exe'
else
  -- bash elsewhere
  vim.o.shell = '/bin/bash'
end
