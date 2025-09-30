local dap = require('dap')
local utils = require('lib.utils')

local function get_net_core_bd_path()
    --BIG HACK COMING UP
    local osName = vim.loop.os_uname().sysname

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

-- dap.configurations.cs = {
--     {
--         type = "coreclr",
--         name = "Launch Console/Wsv",
--         request = "launch",
--         program = function()
--             local dll_path = require('easy-dotnet').get_debug_dll(true).dll_path
--
--             return vim.fn.input('Path to dll: ', dll_path, 'file')
--         end,
--     },
-- }


--use (Get-Process dotnet | Sort-Object StartTime -Descending)[0].Id to get most recent ID on powershell

-- dap.configurations.cs = {
--   {
--     type = 'coreclrattach',
--     name = 'Attach to Kestrel',
--     request = 'attach',
--     processId = function()
--       return vim.fn.input('PID: ', get_most_recent_dotnet_pid())
--     end,
--   },
-- }
