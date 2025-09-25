return {
    --LSPCONFIG: Prebuilt configs for language servers
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/neodev.nvim", opts = {} },
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
            -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            --     vim.lsp.handlers.hover, {
            --         border = "single",
            --     }
            -- )

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
    },
--
}
