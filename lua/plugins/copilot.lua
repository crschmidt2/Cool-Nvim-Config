return {
    {
        "zbirenbaum/copilot.lua",
        enabled = false,
        event = "VeryLazy",
        dependencies = {
            {
                "copilotlsp-nvim/copilot-lsp",
                lazy = true,
                enabled = false,
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
                enabled = false,
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
}
