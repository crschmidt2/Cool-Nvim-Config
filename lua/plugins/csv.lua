return {
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
    require("rainbow_csv").setup()
  end
}
