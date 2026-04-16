return {
    {
        "olimorris/codecompanion.nvim",
        cond = true,
        cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
        keys = {
            { '<leader>as', '<cmd>CodeCompanionChat Toggle<CR>', desc = 'Open copilot chat window', mode = { "n", "v" } },
            { '<leader>ar', '<cmd>CodeCompanionChat<CR>',        desc = 'Open copilot chat window', mode = { "n", "v" } }
        },
        version = "^18.0.0",
        opts = {
            interactions = {
                chat = {
                    opts = {
                        ---Decorate the user message before it's sent to the LLM
                        ---@param message string
                        ---@param adapter CodeCompanion.Adapter
                        ---@param context table
                        ---@return string
                        prompt_decorator = function(message, adapter, context)
                            return string.format([[<prompt>%s</prompt>]], message)
                        end,
                    }
                }
            }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enabled = false,
        keys = {
            { '<leader>as', '<cmd>CopilotChatToggle<CR>', desc = 'Open copilot chat window', mode = { "n", "v" } },
            { '<leader>ar', '<cmd>CopilotChatReset<CR>',  desc = 'Reset copilot chat window' },
        },
        dependencies = {
            { "nvim-lua/plenary.nvim",        branch = "master" },
            { "nvim-telescope/telescope.nvim" }
        },
        opts = {
            model = 'gpt-4o',
            window = { width = 80 },
            --This was hard af to find (had to look at commits), so don't delete unless necessary lol
            mappings = { reset = "" },
        },
        config = function(_, opts)
            require("CopilotChat").setup(opts)
        end
    }
}
