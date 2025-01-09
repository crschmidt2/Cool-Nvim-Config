local term = require("core.utils.terminal")

vim.api.nvim_create_user_command('NpmRun', function()
  term.OpenTerminalInBufTab()
  term.NpmRunDev()
end, {})
