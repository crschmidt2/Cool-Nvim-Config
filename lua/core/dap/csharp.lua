local dap = require('dap')
local net_core_bd_path = vim.fn.stdpath("data") ..
    "/mason/bin/netcoredbg"

dap.adapters.coreclr = {
    type = 'executable',
    command = net_core_bd_path,
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
