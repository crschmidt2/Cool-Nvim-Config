local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.csharp_ls.setup {
  handlers = {
    ["textDocument/definition"] = require('csharpls_extended').handler,
    ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
  },
  filetypes = {
    "cs", "cshtml"
  }
    capabilities = capabilities,
}
