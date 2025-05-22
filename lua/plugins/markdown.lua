return {
    -- {
    --   "iamcco/markdown-preview.nvim",
    --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --   build = "cd app && yarn install",
    --   init = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    --   end,
    --   ft = { "markdown", "help" },
    --   keys = {
    --     { '<leader>ma', '<cmd>MarkdownPreviewToggle<CR>', desc = 'Toggle markdown preview' },
    --   },
    -- },
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
    --BOTH OF THESE ARE INLINE RENDERERS FOR MARKDOWN. I AM NOT SURE WHICH ONE I LIKE MORE :u
    -- {
    --   "OXY2DEV/markview.nvim",
    --   lazy = false, -- Recommended
    --   -- ft = "markdown" -- If you decide to lazy-load anyway
    --
    --   dependencies = {
    --     -- You will not need this if you installed the
    --     -- parsers manually
    --     -- Or if the parsers are in your $RUNTIMEPATH
    --     "nvim-treesitter/nvim-treesitter",
    --
    --     "nvim-tree/nvim-web-devicons"
    --   }
    -- },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        ft = { "markdown" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    },
}
