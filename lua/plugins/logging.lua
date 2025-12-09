local js_like = {
    left = 'console.log("',
    right = '")',
    mid_var = '", ',
    right_var = ")",
}

return {
    -- {
    --     "Goose97/timber.nvim",
    --     version = "*",
    --     event = "VeryLazy",
    --     opts = {
    --         keymaps = {
    --             insert_log_below = "<leader>lj",
    --             insert_log_above = "<leader>lk",
    --             insert_plain_log_below = "<leader>lo",
    --             insert_plain_log_above = "<leader>l<S-o>",
    --             insert_batch_log = "<leader>lb",
    --             add_log_targets_to_batch = "<leader>la",
    --             insert_log_below_operator = false,
    --             insert_log_above_operator = false,
    --             insert_batch_log_operator = false,
    --             add_log_targets_to_batch_operator = false,
    --         }
    --     },
    --     config = function(_, opts)
    --         require("timber").setup(opts)
    --     end
    -- },
    {
        "andrewferrier/debugprint.nvim",
        lazy = true,
        keys = {
            { '<leader>lo', desc = 'Telescope search help tags' },
            { '<leader>lO', desc = 'Telescope find files' },
            { '<leader>lj', desc = 'Telescope find in files' },
            { '<leader>lk', desc = 'Telescope find git files' },
            { '<leader>lS', desc = 'Telescope find highlights' },
            { '<leader>ls', desc = 'Telescope find in current buffer' },
            { '<leader>lt', desc = 'Telescope git changes' },
            { '<leader>ld', desc = 'Telescope git changes' },
        },
        opts = {
            display_counter = false,
            display_snippet = true,
            hightlight_lines = false,
            print_tag = "COOLDUDE06",
            keymaps = {
                normal = {
                    plain_below = "<leader>lo",
                    plain_above = "<leader>lO",
                    variable_below = "<leader>lj",
                    variable_above = "<leader>lk",
                    variable_below_alwaysprompt = false,
                    variable_above_alwaysprompt = false,
                    surround_plain = "<leader>lS",
                    surround_variable = "<leader>ls",
                    surround_variable_alwaysprompt = false,
                    textobj_below = false,
                    textobj_above = false,
                    textobj_surround = false,
                    toggle_comment_debug_prints = "<leader>lt",
                    delete_debug_prints = "<leader>ld",
                },
                insert = {
                    plain = false,
                    variable = false,
                },
                visual = {
                    variable_below = false,
                    variable_above = false,
                },
            },
            filetypes = {
                ["javascript"] = js_like,
                ["javascriptreact"] = js_like,
                ["typescript"] = js_like,
                ["typescriptreact"] = js_like,
                ["vue"] = js_like,
            }
        },
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        version = "*",
        config = function(_, opts)
            require("debugprint").setup(opts)
        end
    }
}
