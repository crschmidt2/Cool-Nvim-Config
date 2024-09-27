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
    { '<leader>cp', '<cmd>set ft=csv_pipe<CR>', desc = 'Set filetype to csv_pipe' },
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
