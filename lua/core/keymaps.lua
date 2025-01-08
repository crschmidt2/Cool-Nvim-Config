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

--YANKING + PASTING
vim.keymap.set({ 'n', 'v' }, '<C-p>', '"0p')

--TOGGLE LINE NUMBERS
vim.keymap.set('', '<leader>n', function()
  local lineNumbers = vim.opt.number:get()
  vim.opt.number = not lineNumbers
  vim.opt.relativenumber = not lineNumbers
end)

-- TERMINAL
-- The terminal emulator uses the shell in your $SHELL
-- environment variable. On windows, you probably want to set this
-- to powershell.
vim.keymap.set('t', [[<C-\>]], [[<C-\><C-n>]])

local job_id = 0
vim.keymap.set("n", "<leader>te", function()
  vim.cmd.tabnew()
  vim.cmd.terminal()

  -- job_id = vim.bo.channel
end
)
