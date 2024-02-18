return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { '<leader>he', '<cmd>Telescope help_tags theme=get_ivy<CR>',                 desc = 'Telescope search help tags' },
    { '<leader>ff', '<cmd>Telescope find_files<CR>',                              desc = 'Telescope find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<CR>',                               desc = 'Telescope find in files' },
    { '<leader>fr', '<cmd>Telescope oldfiles<CR>',                                desc = 'Telescope resume file' },
    { '<leader>bf', '<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', desc = 'Telescope find in current buffer' },
    { '<leader>bs', '<cmd>Telescope lsp_document_symbols theme=get_ivy<CR>',      desc = 'Telescope lsp symbols' },
    { '<leader>gs', '<cmd>Telescope git_status theme=get_ivy<CR>',                desc = 'Telescope git status' },
  },
}
