--CLIPBOARD
vim.opt.clipboard = "unnamedplus"

--Remove comment continuation on newline
--DEFAULT: jcroql (see :help fo-table)

--This stops newlines from continuing comments. Not sure why the vim.opt.formatoptions is not working
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt_local.fo:remove("c")
    vim.opt_local.fo:remove("o")
    vim.opt_local.fo:remove("r")
  end,
})

--TERMINAL
vim.api.nvim_create_autocmd('TermOpen', {
  -- group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

--LINE NUMBER
vim.opt.number = true
vim.opt.relativenumber = true

--TABS & INDENT
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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

--CMD LINE
vim.opt.cmdheight = 0
vim.opt.shortmess:append('W')
