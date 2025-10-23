--CLIPBOARD
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

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

--FONT
vim.g.have_nerd_font = true

--FLOATING WINDOW
vim.opt.winborder = 'rounded'

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

--FIXES POWERSHELL CMD LINE (make sure pwsh is installed if using csv files)
local osName = vim.loop.os_uname().sysname
if osName == 'Windows_NT' then
    if vim.fn.executable('pwsh') then
        vim.o.shell = 'pwsh'
    else
        vim.o.shell = 'powershell'
    end

    vim.o.shellcmdflag =
    '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellquote = ''
    vim.o.shellxquote = ''
end

--SESSIONS
vim.opt.sessionoptions:append({ "localoptions" })
