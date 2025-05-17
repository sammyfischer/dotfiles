--[[
useful editor actions:
editor.action.formatDocument
editor.action.commentLine
workbench.action.navigateBack / ...Forward

example:
vscode.action('editor.action.commentLine')

vscode actions:
vscode.action() - async
vscode.call(name, opts, timeout) - sync

notificatiions:
vscode.notify(msg) - send actual vscode notification
vim.notify = vscode.notify - sets vscode's notifications to be the default

--]]

local ok, vscode = pcall('require', 'vscode')
if ok then
    vscode.notify("My vscode-nvim plugin")
end

return {}
