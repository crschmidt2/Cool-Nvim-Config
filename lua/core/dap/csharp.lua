local dap = require('dap')
local utils = require('lib.utils')

local function get_net_core_bd_path()
    if osName == 'Windows_NT' then
        local net_core_bd_path = vim.fn.stdpath('data') ..
        '\\mason\\' .. 'packages\\netcoredbg\\netcoredbg\\netcoredbg.exe'
        return net_core_bd_path
    end

    local net_core_bd_path = utils.get_mason_bin_file_path('netcoredbg')
    return net_core_bd_path
end

dap.adapters.coreclr = {
    type = 'executable',
    command = get_net_core_bd_path(),
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
