return {
    --CMP: Language Server Completion Integration
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim", "windwp/nvim-autopairs" },
        config = function()
            local cmp = require 'cmp'
            cmp.register_source("easy-dotnet", require("easy-dotnet").package_completion_source)
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    -- { name = 'nvim_lsp_signature_help' },
                    { name = 'buffer' },
                    { name = 'easy-dotnet' }
                }),
                formatting = {
                    format = require('lspkind').cmp_format({
                        mode = 'text_symbol',
                        maxwidth = {
                            menu = 50,
                            abbr = 50,
                        },
                        ellipsis_char = '...',
                        show_labelDetails = true,

                        before = function(_, vim_item)
                            return vim_item
                        end
                    })
                }
            })

            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
}
