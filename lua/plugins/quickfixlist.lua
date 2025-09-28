return {
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        opts = {
            auto_resize_height = true,
            preview            = {
                auto_preview = true,
                border = 'single',
                show_scroll_bar = false,
                show_title = false,
                buf_label = false,
                win_height = 12,
                win_vheight = 12,
            }
        },
        config = function(_, opts)
            require('bqf').setup(opts)
        end
    }
}
