--LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--SAVE & QUIT
vim.keymap.set('', '<C-w>', '<cmd>w<CR>')
vim.keymap.set('', '<C-q>', '<cmd>q<CR>')
vim.keymap.set('', '<C-x>', '<cmd>qa<CR>')

--SPLIT PANES
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.keymap.set('', '<A-y>', '<C-w>v')
vim.keymap.set('', '<A-x>', '<C-w>s')

vim.keymap.set('', '<A-h>', '5<C-w><S-<>')
vim.keymap.set('', '<A-j>', '5<C-w><S-->')
vim.keymap.set('', '<A-k>', '5<C-w><S-+>')
vim.keymap.set('', '<A-l>', '5<C-w><S->>')
vim.keymap.set('', '<A-=>', '<C-w>=')

--CONFIG DEVELOPMENT
vim.keymap.set('', '<leader>c', '<cmd>w<CR><cmd>so<CR><cmd>Lazy install<CR>')

--TOGGLE LINE NUMBERS
vim.keymap.set('', '<leader>n', function() 
local lineNumbers = vim.opt.number:get()
vim.opt.number = not lineNumbers
vim.opt.relativenumber = not lineNumbers
end )
