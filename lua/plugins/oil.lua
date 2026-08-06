return {
    {
        'stevearc/oil.nvim',
        keys = {
            {
                "<C-e>",
                function()
                    require("oil").open_float()
                end,
                desc = "Open oil tree"
            },
        },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            keymaps = {
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<A-y>"] = { "actions.select", opts = { vertical = true } },
                ["<A-x>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-e>"] = { "actions.close", mode = "n" },
            },
            float = {
                max_width = .8,
                preview_split = "auto",
            }
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
