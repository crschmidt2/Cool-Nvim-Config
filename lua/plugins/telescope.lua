return {
    "nvim-telescope/telescope.nvim",
    cond = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-telescope/telescope-ui-select.nvim"
    },
    lazy = true,
    cmd = "Telescope",
    keys = {
        { '<leader>he', '<cmd>Telescope help_tags theme=get_ivy<CR>',                     desc = 'Telescope search help tags' },
        { '<leader>ff', '<cmd>Telescope find_files<CR>',                                  desc = 'Telescope find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>',                                   desc = 'Telescope find in files' },
        { '<leader>fd', '<cmd>Telescope diagnostics<CR>',                                 desc = 'Telescope find diagnostics' },
        { '<leader>gf', '<cmd>Telescope git_files<CR>',                                   desc = 'Telescope find git files' },
        { '<leader>fh', '<cmd>Telescope highlights theme=get_ivy<CR>',                    desc = 'Telescope find highlights' },
        { '<leader>bf', '<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>',     desc = 'Telescope find in current buffer' },
        { '<leader>gc', '<cmd>Telescope git_status theme=get_ivy<CR>',                    desc = 'Telescope git changes' },
        { 'gi',         '<cmd>Telescope lsp_implementations theme=get_ivy<CR>',           desc = 'Telescope implementations' },
        { '<leader>bs', '<cmd>Telescope lsp_document_symbols theme=get_ivy<CR>',          desc = 'Telescope buffer symbols' },
        { '<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_ivy<CR>', desc = 'Telescope workspace symbols' },
    },
    opts = {
        defaults = {
            mappings = {
                n = {},
                i = {}
            },
            -- extensions = {
            --     ["ui-select"] = {
            --         require("telescope.themes").get_dropdown {}
            --     }
            -- }
        }
    },
    config = function(_, opts)
        local actions = require 'telescope.actions'

        local commonMappings = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-f>"] = false,
            ["<C-h>"] = false,
            ["<C-j>"] = false,
            ["<C-k>"] = false,
            ["<C-l>"] = false,
            ["<A-h>"] = actions.preview_scrolling_left,
            ["<A-j>"] = actions.preview_scrolling_down,
            ["<A-k>"] = actions.preview_scrolling_up,
            ["<A-l>"] = actions.preview_scrolling_right,
        }

        opts.defaults.mappings.n = commonMappings
        opts.defaults.mappings.i = commonMappings

        require("telescope").setup(opts)

        -- require("telescope").load_extension("ui-select")
    end
}
