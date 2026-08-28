--SOFT WRAPPING
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.textwidth = 0
vim.opt_local.wrapmargin = 0
vim.opt_local.showbreak = "↳ "

-- Move by visual lines instead of physical lines
vim.keymap.set("n", "j", "gj", { buffer = true, silent = true })
vim.keymap.set("n", "k", "gk", { buffer = true, silent = true })
