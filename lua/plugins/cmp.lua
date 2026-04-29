--Configures cmp to have completion for agents in ~/.copilot/agents
local function agent_autocomplete()
    local cmp = require 'cmp'

    local agent_source = {}
    agent_source.new = function()
        return setmetatable({}, { __index = agent_source })
    end
    agent_source.is_available = function()
        return vim.bo.filetype == 'AgenticInput'
    end
    agent_source.get_trigger_characters = function()
        return { ' ' }
    end
    agent_source.complete = function(_, request, callback)
        local line = request.context.cursor_before_line
        if not line:match('^/agent%s') then
            callback({ items = {}, isIncomplete = false })
            return
        end
        local agents_dir = vim.fn.expand('~/.copilot/agents')
        local files = vim.fn.glob(agents_dir .. '/*.agent.md', false, true)
        local items = {}
        for _, f in ipairs(files) do
            local name = vim.fn.fnamemodify(f, ':t'):gsub('%.agent%.md$', '')
            table.insert(items, {
                label = name,
                kind = cmp.lsp.CompletionItemKind.Text,
                insertText = name,
                data = { filepath = f },
            })
        end
        callback({ items = items, isIncomplete = false })
    end
    agent_source.resolve = function(_, completion_item, callback)
        local filepath = completion_item.data and completion_item.data.filepath
        if filepath then
            local lines = {}
            for line in io.lines(filepath) do
                table.insert(lines, line)
                if #lines >= 10 then break end
            end
            completion_item.documentation = {
                kind = 'markdown',
                value = table.concat(lines, '\n'),
            }
        end
        callback(completion_item)
    end
    cmp.register_source('agentic_agents', agent_source)

    cmp.setup.filetype('AgenticInput', {
        sources = { { name = 'agentic_agents' } }
    })
end

return {
    --CMP: Language Server Completion Integration
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim" },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0,
            })
        end,
        config = function()
            local cmp = require 'cmp'
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
                    ['<C-j>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ['<C-k>'] = function(fallback)
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

            agent_autocomplete()

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local handlers = require('nvim-autopairs.completion.handlers')
            local autoutils = require('nvim-autopairs.utils')

            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done({
                    filetypes = {
                        ["vue"] = {
                            ["("] = {
                                kind = {
                                    cmp.lsp.CompletionItemKind.Function,
                                    cmp.lsp.CompletionItemKind.Method,
                                },
                                handler = function(char, item, bufnr, rules, commit_character)
                                    --Vuetify elements are handled as functions for some reason. This will close the tag.
                                    if string.match(item.label, ('^v%-')) then
                                        local line = autoutils.text_get_current_line(bufnr)
                                        local _, col = autoutils.get_cursor()
                                        local char_before, char_after = autoutils.text_cusor_line(line, col, 1, 1, false)
                                        local length = #item.label

                                        if char == '' or char_before == char or char_after == char
                                            or (item.data and item.data.funcParensDisabled)
                                            or (item.textEdit and item.textEdit.newText and item.textEdit.newText:match "[%(%[%$]")
                                            or (item.insertText and item.insertText:match "[%(%[%$]")
                                        then
                                            return
                                        end

                                        autoutils.feed('>')
                                        autoutils.feed(autoutils.key.right, 1)
                                        autoutils.feed('</' .. item.label .. '>')
                                        autoutils.feed(autoutils.key.right, length + 3)
                                        return
                                    end

                                    handlers["*"](char, item, bufnr, rules)
                                end
                            }
                        },
                        ["ps1"] = {
                            ["("] = {
                                kind = {
                                    cmp.lsp.CompletionItemKind.Function,
                                },
                                handler = function()
                                end
                            }
                        }
                    }
                })
            )

            --Keep copilot suggestions closed when cmp menu open
            -- cmp.event:on("menu_opened", function()
            --     vim.b.copilot_suggestion_hidden = true
            -- end)
            --
            -- cmp.event:on("menu_closed", function()
            --     vim.b.copilot_suggestion_hidden = false
            -- end)
        end
    },
}
