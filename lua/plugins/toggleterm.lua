return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        keys = { { '<C-o>', "<CMD>ToggleTerm<CR>", desc = "Open floating terminal", mode = { 'n', 'v', 't' } } },
        cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermExec', 'TermNew', 'TermSelect' },
        opts = {},
        config = function(_, opts)
            require("toggleterm").setup(opts)
        end
    }
}
