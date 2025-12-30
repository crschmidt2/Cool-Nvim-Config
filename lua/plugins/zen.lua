return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = {
            { "<leader>zm", "<cmd>ZenMode<CR>", desc = "Toggle zen mode" } },
        dependencies = {
            {
                "folke/twilight.nvim",
                opts = {
                    -- Use :InspectTree to get the treesitter name for what you want to highlight. Highest ancestor in the tree gets highlighted
                    expand = {
                        "function",
                        "method",
                        "table",
                        "if_statement",
                    }
                }
            }
        },
        opts = {
            window = {
                backdrop = 0.8,
                width = 180
            },
            plugins = {
                gitsigns = { enabled = true }
            },
            on_open = function(_)
                require('gitsigns').detach_all()
            end,
            on_close = function()
                require('gitsigns').attach()
                require('gitsigns').refresh()
            end
        },
    },
}
