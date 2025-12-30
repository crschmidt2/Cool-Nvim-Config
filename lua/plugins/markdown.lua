return {
    {
        "frabjous/knap",
        ft = { "markdown", "plaintex" },
        keys = {
            {
                '<F5>',
                function()
                    require("knap").process_once()
                end,
                desc = 'processes the document once, and refreshes the view'
            },
            {
                '<F6>',
                function()
                    require("knap").close_viewer()
                end,
                desc = 'closes the viewer application, and allows settings to be reset'
            },
            {
                '<F7>',
                function()
                    require("knap").toggle_autopreviewing()
                end,
                desc = 'toggles the auto-processing on and off'
            },
            {
                '<F8>',
                function()
                    require("knap").forward_jump()
                end,
                desc = 'invokes a SyncTeX forward search, or similar, where appropriate'
            },
        }
    },
    {
        'Kicamon/markdown-table-mode.nvim',
        ft = { "markdown" },
        config = function()
            require('markdown-table-mode').setup()
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            file_types = { "markdown", "Avante", "copilot-chat" },
        },
        ft = { "markdown", "Avante" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    },
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
            "norg",
        },
        config = function()
            require("autolist").setup()

            -- vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
            -- vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
            -- vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
            -- vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
            -- vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
            -- vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
            vim.keymap.set("n", "<leader>r", "<cmd>AutolistRecalculate<cr>")

            -- cycle list types with dot-repeat
            vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
            vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

            -- if you don't want dot-repeat
            -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
            -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

            -- functions to recalculate list on edit
            -- vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
            -- vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
            -- vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
            -- vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")

            vim.api.nvim_create_autocmd('InsertLeave', {
                pattern = { '*.md' },
                callback = function()
                    vim.api.nvim_command("AutolistRecalculate")
                end
            })
        end,
    },
}
