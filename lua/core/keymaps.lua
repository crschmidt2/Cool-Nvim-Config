--LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Paste from last yank
vim.keymap.set('','<leader>p', '"0p')
--Clear search highlights
vim.keymap.set('', '<leader>h', ':noh<CR>')

vim.keymap.set('n', '<leader>kd', 'gg^vG$=')

--Funny
vim.keymap.set('n', '<leader>lhs', function() print("Tyler is a poopy head") end)
