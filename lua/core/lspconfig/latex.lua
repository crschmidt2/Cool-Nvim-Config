local capabilities = vim.lsp.protocol.make_client_capabilities()

local texlab_ls_path = vim.fn.stdpath("data") ..
    "/mason/bin/texlab"

require 'lspconfig'.texlab.setup {
    cmd = { texlab_ls_path },
    capabilities = capabilities
}
