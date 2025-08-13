local capabilities = require('cmp_nvim_lsp').default_capabilities()

local rust_ls_path = vim.fn.stdpath("data") ..
    "/mason/bin/rust-analyzer"

require 'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    cmd = { rust_ls_path }
}
