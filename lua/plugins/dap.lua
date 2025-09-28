return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            { '<C-N>',      '<cmd>DapContinue<CR>',         desc = 'Start/continue debugging' },
            { '<F10>',     '<cmd>DapStepOver<CR>',         desc = 'Step over' },
            { '<C-M>',     '<cmd>DapStepOver<CR>',         desc = 'Step over' },
            { '<F11>',     '<cmd>DapStepInto<CR>',         desc = 'Step into' },
            { '<C-.>',     '<cmd>DapStepInto<CR>',         desc = 'Step into' },
            { '<F12>',     '<cmd>DapStepOut<CR>',          desc = 'Step out' },
            { '<C-,>',     '<cmd>DapStepOut<CR>',          desc = 'Step out' },
            { '<leader>d', '<cmd>DapToggleBreakpoint<CR>', desc = 'Toggle breakpoint' },
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
            -- .NET specific setup using `easy-dotnet`
            require("easy-dotnet.netcoredbg").register_dap_variables_viewer()

            require('core.dap')
            local dap = require('dap')

            --Keymaps
            vim.keymap.set("n", "<C-N>", dap.continue, { desc = "Start/continue debugging" })
            vim.keymap.del("n", "<CR>")
            vim.keymap.set("n", "q", function()
                dap.terminate()
            end, { desc = "Terminate and clear breakpoints" })
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
