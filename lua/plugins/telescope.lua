return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { '<leader>he', '<cmd>Telescope help_tags theme=get_ivy<CR>',                 desc = 'Telescope search help tags' },
    { '<leader>ff', '<cmd>Telescope find_files<CR>',                              desc = 'Telescope find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<CR>',                               desc = 'Telescope find in files' },
    { '<leader>fr', '<cmd>Telescope git_files<CR>',                               desc = 'Telescope find git files' },
    { '<leader>fh', '<cmd>Telescope highlights theme=get_ivy<CR>',                desc = 'Telescope find highlights' },
    { '<leader>bf', '<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', desc = 'Telescope find in current buffer' },
    { '<leader>gs', '<cmd>Telescope git_status theme=get_ivy<CR>',                desc = 'Telescope git status' },
    { 'gr',         '<cmd>Telescope lsp_references theme=get_ivy<CR>',            desc = 'Telescope references' },
    { 'gi',         '<cmd>Telescope lsp_implementations theme=get_ivy<CR>',       desc = 'Telescope implementations' },
    --    { 'gd',         '<cmd>Telescope lsp_definitions theme=get_ivy<CR>', desc = 'Telescope definitions' },
    --{ 'gd',         "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", desc = 'Telescope definitions' },
    { '<leader>bs', '<cmd>Telescope lsp_document_symbols theme=get_ivy<CR>',      desc = 'Telescope symbols' },
  },
}
