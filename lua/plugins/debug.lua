local dap = require('dap')

return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            { '<F5>',  dap.continue,  desc = 'Start/continue debugging' },
            { '<F10>', dap.step_over, desc = 'Step over' },
            { '<F11>', dap.step_into, desc = 'Step into' },
            { '<F12>', dap.step_out,  desc = 'Step out' },
            { '<leader>b', dap.toggle_breakpoint,  desc = 'Toggle breakpoint' },
            { '<leader>dk', dap.run_to_cursor,  desc = 'Run to cursor' },
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
        config = function(_, opts)
            require('core.dap')
        end
    }
}
