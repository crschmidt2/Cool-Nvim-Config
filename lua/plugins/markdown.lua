return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
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
}
