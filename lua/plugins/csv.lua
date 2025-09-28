return {

    --==============================
    --Lua port of rainbow_csv. Kinda buggy, try later
    --==============================
    {
        'cameron-wags/rainbow_csv.nvim',
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        keys = {
            { '<leader>cp', '<cmd>RainbowDelimSimple<CR>', desc = 'Deliminates the current buffer based on symbol under cursor' },
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        },
        config = function()
            vim.g.rbql_backend_language = 'js'
            vim.g.rbql_encoding = 'latin-1'
            require("rainbow_csv").setup()
        end
    },

    --==============================
    --OG VimScript of rainbow_csv
    --==============================
    -- {
    --     'mechatroner/rainbow_csv',
    --     ft = {
    --         'csv',
    --         'tsv',
    --         'csv_semicolon',
    --         'csv_whitespace',
    --         'csv_pipe',
    --         'rfc_csv',
    --         'rfc_semicolon'
    --     },
    --     keys = {
    --         { '<leader>cp', '<cmd>RainbowDelimSimple<CR>', desc = 'Deliminates the current buffer based on symbol under cursor' },
    --         { '<F5>', '<cmd>RainbowQuery<CR>', desc = 'Opens query editing window for RBQL' },
    --     },
    --     cmd = {
    --         'RainbowDelim',
    --         'RainbowMultiDelim'
    --     },
    -- init = function()
    --   vim.g.rbql_backend_language = 'js'
    -- end
    -- }
}
