return {
    {
        "carlos-algms/agentic.nvim",
        cond         = true,
        --- @type agentic.PartialUserConfig
        opts         = {
            provider = "copilot-acp",
            file_picker = { enabled = false }, -- use nvim-cmp instead
        },
        config       = function(_, opts)
            -- Disable built-in slash command completion (no config flag exists);
            -- this prevents completefunc + <C-x><C-u> from competing with nvim-cmp
            local SlashCommands = require("agentic.acp.slash_commands")
            SlashCommands.setup_completion = function(_) end
            require("agentic").setup(opts)
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        keys         = {
            {
                "<leader>as",
                function() require("agentic").toggle() end,
                mode = { "n" },
                desc = "Toggle Agentic Chat"
            },
            {
                "<C-a>",
                function() require("agentic").add_selection_or_file_to_context() end,
                mode = { "n", "v" },
                desc = "Add file or selection to Agentic to Context"
            },
            {
                "<leader>ar",
                function() require("agentic").new_session() end,
                mode = { "n" },
                desc = "New Agentic Session"
            },
            {
                "<leader>ah",
                function()
                    require("agentic").restore_session()
                end,
                desc = "Agentic Restore session",
                silent = true,
                mode = { "n" },
            },
            {
                "<leader>ad", -- ai Diagnostics
                function()
                    require("agentic").add_current_line_diagnostics()
                end,
                desc = "Add current line diagnostic to Agentic",
                mode = { "n" },
            },
            {
                "<leader>aD", -- ai all Diagnostics
                function()
                    require("agentic").add_buffer_diagnostics()
                end,
                desc = "Add all buffer diagnostics to Agentic",
                mode = { "n" },
            },
        },

    },
    {
        "olimorris/codecompanion.nvim",
        cond = false,
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
    },
    {
        "yetone/avante.nvim",
        cond = false,
        event = "VeryLazy",
        version = false,
        build = vim.fn.has("win32") == 1
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        keys = {
            { "<leader>as", "<cmd>AvanteToggle<CR>",  desc = "Toggle Avante sidebar", mode = { "n" } },
            { "<leader>ar", "<cmd>AvanteChatNew<CR>", desc = "Refresh Avante",        mode = { "n" } },
            { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "AvanteHistory",         mode = { "n" } },
            {
                "<C-'>",
                function() require("avante.api").ask({ selection = true }) end,
                desc = "Ask Avante about selection",
                mode = { "n", "v" }
            },
            {
                "<leader>ad",
                function() require("avante.api").ask({ question = "Explain and fix the diagnostics on this line." }) end,
                desc = "Ask Avante about diagnostics",
                mode = { "n" }
            },
        },
        opts = {
            provider = "copilot",
            default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                    insert_mode = true,
                },
                use_absolute_path = true,
            },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "folke/snacks.nvim",
        },
    }
}
