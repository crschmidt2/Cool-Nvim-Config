local dap = require('dap')
local utils = require('lib.utils')

local net_core_bd_path = utils.get_mason_bin_file_path('netcoredbg')

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
            local dll_path = require('easy-dotnet').get_debug_dll(true).dll_path

            return vim.fn.input('Path to dll', dll_path, 'file')
        end,
    },
}
