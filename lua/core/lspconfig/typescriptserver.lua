--Hybrid Typescript + Vue config. See vuejs/language-tools nvim section for explanation
--Typescript handles <script> section, Volar handles Markup + CSS. Typescript vue plugin lets them communicate.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local typescript_ls_path = vim.fn.stdpath("data") ..
    "/mason/bin/typescript-language-server"

local typescript_lib_path = vim.fn.stdpath("data") ..
    "/mason/packages/typescript-language-server/node_modules/typescript/lib"

local volar_ls_path = vim.fn.stdpath("data") ..
    "/mason/bin/vue-language-server"

local ts_vue_plugin_path = vim.fn.stdpath("data") ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

require('lspconfig').ts_ls.setup {
    init_options = {
        hostInfo = "neovim",
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = ts_vue_plugin_path,
                languages = { 'vue' },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'rbql' },
    cmd = { typescript_ls_path, "--stdio" },
    capabilities = capabilities
}


require('lspconfig').volar.setup {
    cmd = { volar_ls_path, "--stdio" },
    init_options = {
        typescript = {
            tsdk = typescript_lib_path
        }
    },
    settings = {
        vue = {
            complete = {
                casing = {
                    tags = "autoKebab"
                }
            }
        }
    },
    capabilities = capabilities
}
