local term = require("core.utils.terminal")

--LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--SAVE & QUIT
vim.keymap.set('', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('', '<C-q>', '<cmd>q<CR>')
vim.keymap.set('', '<C-x>', '<cmd>qa<CR>')

--TABS
vim.keymap.set({ 'n', 'v', 'i' }, '<C-t>', '<cmd>tabnew<CR>')

--SPLIT PANES
vim.keymap.set('', '<C-h>', function() vim.cmd.wincmd('h') end)
vim.keymap.set('', '<C-j>', function() vim.cmd.wincmd('j') end)
vim.keymap.set('', '<C-k>', function() vim.cmd.wincmd('k') end)
vim.keymap.set('', '<C-l>', function() vim.cmd.wincmd('l') end)

vim.keymap.set('', '<A-y>', '<C-w>v')
vim.keymap.set('', '<A-x>', '<C-w>s')

vim.keymap.set('', '<A-h>', '5<C-w><S-<>')
vim.keymap.set('', '<A-j>', '5<C-w><S-->')
vim.keymap.set('', '<A-k>', '5<C-w><S-+>')
vim.keymap.set('', '<A-l>', '5<C-w><S->>')
vim.keymap.set('', '<A-=>', '<C-w>=')

--YANKING + PASTING
vim.keymap.set({ 'n', 'v' }, '<C-p>', '"0p')

--TOGGLE LINE NUMBERS
vim.keymap.set('', '<leader>rn', function()
    local lineNumbers = vim.opt.relativenumber:get()
    vim.opt.relativenumber = not lineNumbers
end)

-- TERMINAL
-- The terminal emulator uses the shell in your $SHELL
-- environment variable. On windows, you probably want to set this
-- to powershell.
local termNormalMode = [[<C-\><C-n>]]
local termWinCmd = function(wincmd)
    vim.api.nvim_input(termNormalMode)
    vim.cmd.wincmd(wincmd)
end
vim.keymap.set('t', [[<ESC>]], termNormalMode)
vim.keymap.set('t', '<C-h>', function() termWinCmd('h') end)
vim.keymap.set('t', '<C-j>', function() termWinCmd('j') end)
vim.keymap.set('t', '<C-k>', function() termWinCmd('k') end)
vim.keymap.set('t', '<C-l>', function() termWinCmd('l') end)

vim.keymap.set("n", "<leader>t", function()
    term.toggle_floating_terminal()
end
)
