return {
    "cbochs/grapple.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    cmd = "Grapple",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        -- Default is "git". "git_branch" namespaces tags per branch and
        -- falls back to "cwd" outside a git repo.
        scope = "git_branch",
    },
    keys = {
        { '<leader>m', '<cmd>Grapple toggle<CR>',         desc = 'Grapple toggle tag on current file' },
        { '<leader>M', '<cmd>Grapple toggle_tags<CR>',    desc = 'Grapple open tag list' },
        -- { '<leader>n',  '<cmd>Grapple cycle_tags next<CR>',  desc = 'Grapple cycle to next tag' },
        -- { '<leader>p',  '<cmd>Grapple cycle_tags prev<CR>',  desc = 'Grapple cycle to previous tag' },

        { '<leader>1', '<cmd>Grapple select index=1<CR>', desc = 'Grapple select tag 1' },
        { '<leader>2', '<cmd>Grapple select index=2<CR>', desc = 'Grapple select tag 2' },
        { '<leader>3', '<cmd>Grapple select index=3<CR>', desc = 'Grapple select tag 3' },
        { '<leader>4', '<cmd>Grapple select index=4<CR>', desc = 'Grapple select tag 4' },
        { '<leader>5', '<cmd>Grapple select index=5<CR>', desc = 'Grapple select tag 5' },
        { '<leader>6', '<cmd>Grapple select index=6<CR>', desc = 'Grapple select tag 6' },
        { '<leader>7', '<cmd>Grapple select index=7<CR>', desc = 'Grapple select tag 7' },
        { '<leader>8', '<cmd>Grapple select index=8<CR>', desc = 'Grapple select tag 8' },
        { '<leader>9', '<cmd>Grapple select index=9<CR>', desc = 'Grapple select tag 9' },
        { '<leader>0', '<cmd>Grapple select index=10<CR>', desc = 'Grapple select tag 10' },

        -- Telescope picker. The extension is registered on first use so
        -- telescope stays lazy (its spec only loads on `cmd = "Telescope"`).
        {
            '<leader>fm',
            function()
                require("telescope").load_extension("grapple")
                vim.cmd("Telescope grapple tags theme=dropdown")
            end,
            desc = 'Telescope find grapple tags',
        },
    },
}
