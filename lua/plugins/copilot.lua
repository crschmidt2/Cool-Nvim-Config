return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        {
            "copilotlsp-nvim/copilot-lsp",
            event = "VeryLazy",
            init = function()
                vim.g.copilot_nes_debounce = 500
            end,
            opts = {
                nes = {
                    move_count_threshold = 3,
                }
            },
            config = function(_, opts)
                require('copilot-lsp').setup(opts)
            end
        }
    },
    event = "VeryLazy",
    keys = {
        { '<leader>aa', '<cmd>Copilot panel toggle<CR>', desc = 'Toggle copilot panel' },
    },
    opts = {
        filetypes = {
            markdown = true
        },
        panel     = {
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
        nes       = {
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
}
