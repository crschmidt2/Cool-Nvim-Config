return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            {
                '<F5>',
                function()
                    require 'dap'.continue()
                end,
                desc = 'Start/continue debugging'
            },
            { '<F10>',     '<cmd>DapStepOver<CR>',         desc = 'Step over' },
            { '<C-M>',     '<cmd>DapStepOver<CR>',         desc = 'Step over' },
            { '<F11>',     '<cmd>DapStepInto<CR>',         desc = 'Step into' },
            { '<C-.>',     '<cmd>DapStepInto<CR>',         desc = 'Step into' },
            { '<F12>',     '<cmd>DapStepOut<CR>',          desc = 'Step out' },
            { '<C-N>',     '<cmd>DapStepOut<CR>',          desc = 'Step out' },
            { '<leader>d', '<cmd>DapToggleBreakpoint<CR>', desc = 'Toggle breakpoint' },
            {
                '<leader>dk',
                function()
                    require 'dap'.goto_()
                end,
                desc = 'Run to cursor'
            },
        },
        cmd = {
            'DapNew',
            'DapPause',
            'DapShowLog',
            'DapStepOut',
            'DapContinue',
            'DapStepInto',
            'DapStepOver',
            'DapTerminate',
            'DapDisconnect',
            'DapToggleRepl',
            'DapSetLogLevel',
            'DapRestartFrame',
            'DapClearBreakpoints',
            'DapToggleBreakpoint',
            'DapEval'
        },
        config = function()
            -- require('core.dap')
            local dap = require('dap')
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
            -- -- Keymaps for controlling the debugger
            -- vim.keymap.set("n", "q", function()
            --     dap.terminate()
            --     dap.clear_breakpoints()
            -- end, { desc = "Terminate and clear breakpoints" })

            -- .NET specific setup using `easy-dotnet`
            require("easy-dotnet.netcoredbg").register_dap_variables_viewer()
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function(_, opts)
            require('dapui').setup(opts)

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }
}
