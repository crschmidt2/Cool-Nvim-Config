return {
    --LSPCONFIG: Prebuilt configs for language servers
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "ray-x/lsp_signature.nvim",
                event = "InsertEnter",
                dependencies = { 'neovim/nvim-lspconfig' },
                opts = {
                    bind = true,
                    handler_opts = {
                        border = "rounded"
                    },
                    hint_prefix = "",
                },
                config = function(_, opts) require 'lsp_signature'.setup(opts) end
            }
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', function()
                        vim.cmd('tab split')
                        vim.lsp.buf.definition()
                    end, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gl', vim.lsp.codelens.run, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
                        require('conform').format { async = true, lsp_format = 'fallback' }
                    end, opts)
                end,
            })
        end
    },
}
