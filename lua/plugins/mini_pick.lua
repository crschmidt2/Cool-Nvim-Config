return {
    "nvim-mini/mini.pick",
    -- dependencies = {
    --     "nvim-mini/mini.extra",
    --     "nvim-mini/mini.icons",
    -- },
    lazy = false,
    -- keys = {
    --     { '<leader>he', function() require('mini.pick').builtin.help() end,                              desc = 'Pick help tags' },
    --     { '<leader>ff', function() require('mini.pick').builtin.files() end,                              desc = 'Pick find files' },
    --     { '<leader>fg', function() require('mini.pick').builtin.grep_live() end,                          desc = 'Pick live grep' },
    --     { '<leader>fd', function() require('mini.extra').pickers.diagnostic() end,                        desc = 'Pick diagnostics' },
    --     { '<leader>gf', function() require('mini.pick').builtin.files({ tool = 'git' }) end,              desc = 'Pick git files' },
    --     { '<leader>fh', function() require('mini.extra').pickers.hl_groups() end,                         desc = 'Pick highlights' },
    --     { '<leader>bf', function() require('mini.extra').pickers.buf_lines({ scope = 'current' }) end,    desc = 'Pick in current buffer' },
    --     { '<leader>gc', function() require('mini.extra').pickers.git_hunks() end,                         desc = 'Pick git changes' },
    --     { 'gi',         function() require('mini.extra').pickers.lsp({ scope = 'implementation' }) end,   desc = 'Pick LSP implementations' },
    --     { '<leader>bs', function() require('mini.extra').pickers.lsp({ scope = 'document_symbol' }) end,  desc = 'Pick buffer symbols' },
    --     { '<leader>ws', function() require('mini.extra').pickers.lsp({ scope = 'workspace_symbol' }) end, desc = 'Pick workspace symbols' },
    -- },
    config = function()
        require('mini.pick').setup({
            mappings = {
                scroll_left  = '<A-h>',
                scroll_down  = '<A-j>',
                scroll_up    = '<A-k>',
                scroll_right = '<A-l>',
                move_down = '<C-j>',
                move_up = '<C-k>',
                move_start = '<C-g>',
            },
        })

        vim.ui.select = require('mini.pick').ui_select
    end,
}
