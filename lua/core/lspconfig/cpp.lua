local clang_ls_path = vim.fn.stdpath("data") ..
    "/mason/bin/clangd"

require 'lspconfig'.clangd.setup {
    cmd = { clang_ls_path }
}
