--VUE 3 SETUP

local volarPath = vim.fn.stdpath("data") ..
    "/mason/packages/typescript-language-server/node_modules/typescript/lib"

require'lspconfig'.volar.setup{
  init_options = {
    typescript = {
      tsdk = volarPath
    }
  }
}

--TYPESCRIPT SETUP

local vue_language_server_path = vim.fn.stdpath("data") ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require 'lspconfig'.ts_ls.setup {
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue', 'typescript', 'javascript' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'rbql' },
}
