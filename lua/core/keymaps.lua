--LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Paste from last yank
vim.keymap.set('','<leader>p', '"0p')
--Clear search highlights
vim.keymap.set('', '<leader>h', ':noh<CR>')

vim.keymap.set('', '<C-s>', ':w<CR>')

--Funny
vim.keymap.set('n', '<leader>lhs', function() print("Tyler is a poopy head") end)

