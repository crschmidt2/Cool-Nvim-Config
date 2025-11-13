--TODO: This is complicated; not sure if works for vue in chrome
local dap = require('dap')
local utils = require('lib.utils')

local function get_js_dbg_path()
    --BIG HACK COMING UP
    local osName = vim.loop.os_uname().sysname

    if osName == 'Windows_NT' then
        local js_dbg_path = vim.fn.stdpath('data') ..
            '\\mason\\' .. 'packages\\js-debug-adapter\\js-debug\\src\\dapDebugServer.js'
        return js_dbg_path
    end

    local js_dbg_path = utils.get_mason_bin_file_path('js-debug-adapter')
    return js_dbg_path
end

--Gotten from https://www.youtube.com/watch?v=DVG3m7rNFKc / https://github.com/StevanFreeborn/nvim-config/blob/main/lua/plugins/debugging.lua
for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
    local pwaType = "pwa-" .. adapterType

    --Adapter for various functions of js-debug-adapter (instead of using deprecated chrome-debugger)
    dap.adapters[pwaType] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
            command = "node",
            args = {
                get_js_dbg_path(),
                "${port}",
            },
        },
    }

    --Reads launch.json configurations. They use "chrome", "node", and "msedge" instead of "pwa-" as a prefix.
    dap.adapters[adapterType] = function(cb, config)
        local nativeAdapter = dap.adapters[pwaType]

        config.type = pwaType

        if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
        else
            cb(nativeAdapter)
        end
    end
end

--Select port of npm run dev process
local enter_launch_url = function()
    local co = coroutine.running()
    return coroutine.create(function()
        vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
            if url == nil or url == "" then
                return
            else
                coroutine.resume(co, url)
            end
        end)
    end)
end

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file using Node.js (nvim-dap)",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process using Node.js (nvim-dap)",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
        -- requires ts-node to be installed globally or locally
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Launch file using Node.js with ts-node/register (nvim-dap)",
        --   program = "${file}",
        --   cwd = "${workspaceFolder}",
        --   runtimeArgs = { "-r", "ts-node/register" },
        -- },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome (nvim-dap)",
            url = enter_launch_url,
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**", "**/node_modules/**" }
        },
        {
            type = "pwa-msedge",
            request = "launch",
            name = "Launch Edge (nvim-dap)",
            url = enter_launch_url,
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
        },
    }
end
