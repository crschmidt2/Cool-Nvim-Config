return {
    {
        "zbirenbaum/copilot.lua",
        lazy = true,
        dependencies = {
            {
                "copilotlsp-nvim/copilot-lsp",
                lazy = true,
                init = function()
                    vim.g.copilot_nes_debounce = 1000
                end,
                opts = {
                    nes = {
                        enabled = true,
                        move_count_threshold = 3,
                    }
                },
                config = function(_, opts)
                    require('copilot-lsp').setup(opts)
                end
            }
        },
        keys = {
            { '<leader>aa', '<cmd>Copilot panel toggle<CR>', desc = 'Toggle copilot panel' },
        },
        opts = {
            filetypes  = {
                markdown = true
            },
            panel      = {
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = nil
                },
                suggestion = {
                    auto_trigger = false,
                    hide_during_completion = true,
                    trigger_on_accept = true
                },
                layout = {
                    position = "right"
                },
            },
            suggestion = {
                enabled = false,
            },
            nes        = {
                enabled = true,
                keymap = {
                    accept_and_goto = "<leader>ac",
                    accept = false,
                    dismiss = "<Esc>"
                }
            }
        },
        config = function(_, opts)
            require("copilot").setup(opts)
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        cond = true,
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
}
