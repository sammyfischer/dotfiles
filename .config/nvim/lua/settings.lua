-- open help in new tab
-- currently this is the best solution, but if you run :h in a tab with 1 window, it will use that window
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  command = 'wincmd T',
})

-- this doesn't correctly pass args to :h
-- vim.api.nvim_create_user_command(
--   'H',
--   function(ctx)
--     -- forward args (if nil, set to 0)
--     if (ctx.nargs or 0) > 0 then
--       vim.cmd('tab help ' .. ctx.args)
--     else
--       vim.cmd('tab help')
--     end
--   end,
--   {
--     desc = 'Open help page in new tab',
--     nargs = '*',
--   }
-- )

vim.api.nvim_create_user_command(
  'Term',
  function()
    vim.cmd('tabnew')
    vim.cmd('terminal')
  end,
  { desc = 'Open terminal in new tab' }
)

-- vim.api.nvim_create_autocmd('TermOpen', {
--   command = 'wincmd T',
-- })

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank({ timeout = 400 })
  end,
})

-- set default shell
if jit.os:find('Windows') then
  -- powershell on windows
  vim.o.shell = 'powershell.exe'
else
  -- bash elsewhere
  vim.o.shell = '/bin/bash'
end
