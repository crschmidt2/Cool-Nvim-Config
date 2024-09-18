return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- build = function() vim.fn["mkdp#util#install"]() end,
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { '<leader>ma', '<cmd>MarkdownPreviewToggle<CR>', desc = 'Toggle markdown preview' },
    },
    -- config = function()
    --   -- vim.keymap.set('', '<leader>ma', '<cmd>MarkdownPreviewToggle<CR>')
    -- end
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
