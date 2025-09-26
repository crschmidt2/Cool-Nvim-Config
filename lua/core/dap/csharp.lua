local dap = require('dap')
local net_core_bd_path = vim.fn.stdpath("data") ..
    "/mason/bin/netcoredbg"

--Hacky way to get nvim-dap working with Mason
local osName = vim.loop.os_uname().sysname
if osName == 'Windows_NT' then
    net_core_bd_path = net_core_bd_path .. '.cmd'
end

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
