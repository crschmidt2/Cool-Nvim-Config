--CLIPBOARD
vim.opt.clipboard = "unnamedplus"

--Remove comment continuation on newline
--DEFAULT: jcroql (see :help fo-table)
vim.opt.formatoptions = "jql"

--LINE NUMBER
vim.opt.number = true
vim.opt.relativenumber = true

--TABS & INDENT
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false

--COLOR
vim.opt.termguicolors = true

--FILE EXPLORER
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--SEARCHING
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = ""

--SCROLLING
vim.opt.scrolloff = 4
