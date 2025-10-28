return {
    {
        'mfussenegger/nvim-dap',
        dependencies = { 'rcarriga/nvim-dap-ui' },
        keys = {
            { '<C-N>',     function() require("dap").continue() end,          desc = 'Start/continue debugging' },
            { '<leader>d', function() require("dap").toggle_breakpoint() end, desc = 'Toggle breakpoint' },
        },
        config = function()
            -- .NET specific setup using `easy-dotnet`
            require("easy-dotnet.netcoredbg").register_dap_variables_viewer()

            require('core.dap')
            local dap = require('dap')

            --Keymaps
            vim.keymap.set("n", "<C-N>", dap.continue, { desc = "Start/continue debugging" })
            vim.keymap.set("n", "<C-M>", dap.step_over, { desc = "Step over" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
            vim.keymap.set("n", "C-.", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<C-,>", dap.step_out, { desc = "Step out" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
            -- vim.keymap.del("n", "<CR>")
            vim.keymap.set("n", "q", function()
                dap.terminate()
            end, { desc = "Terminate and clear breakpoints" })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        lazy = true,
        opts = {},
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
