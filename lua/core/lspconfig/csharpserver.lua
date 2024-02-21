require 'lspconfig'.csharp_ls.setup {
  handlers = {
    ["textDocument/definition"] = require('csharpls_extended').handler,
    ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
  },
  filetypes = {
    "cs", "cshtml"
  }
}
