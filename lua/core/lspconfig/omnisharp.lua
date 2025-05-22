local capabilities = require('cmp_nvim_lsp').default_capabilities()

local omnisharpPath = vim.fn.stdpath("data") ..
    "/mason/packages/omnisharp/libexec/Omnisharp.dll"

require 'lspconfig'.omnisharp.setup {
    cmd = { "dotnet", omnisharpPath },
    settings = {
        FormattingOptions = {
            OrganizeImports = true,
        },
        RoslynExtensionsOptions = {
            EnableImportCompletion = true
        }
    },
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/references"] = require('omnisharp_extended').references_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
    },
    filetypes = {
        "cs", "cshtml"
    }
    capabilities = capabilities,
}
