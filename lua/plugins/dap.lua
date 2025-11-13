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
            vim.keymap.set("n", "<leader>dt", function()
                dap.terminate()
            end, { desc = "Terminate" })
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
            vim.keymap.set("n", "<leader>du", function()
                -- dapui.toggle({layout = } )
                dapui.toggle({ layout = 1 })
            end, { desc = "Toggle DAP UI" })
            -- dap.listeners.before.attach.dapui_config = function()
            --     dapui.open()
            -- end
            -- dap.listeners.before.launch.dapui_config = function()
            --     dapui.open()
            -- end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
    -- USE ONCE NVIM DAP IMPLEMENTS TOGGLE BREAKPOINT. DAP UI USES CUSTOM LOGIC TO HANDLE TOGGLING OF BREAKPOINTS. SEE https://github.com/igorlfs/nvim-dap-view/issues/74
    -- {
    --     "igorlfs/nvim-dap-view",
    --     ---@module 'dap-view'
    --     ---@type dapview.Config
    --     opts = {},
    --     config = function(_, opts)
    --         local dap = require("dap")
    --         local dap_view = require("dap-view")
    --
    --         dap.listeners.before.event_terminated.dapview_config = function()
    --             dapui.close()
    --         end
    --         dap.listeners.before.event_exited.dapview_config = function()
    --             dapui.close()
    --         end
    --
    --         vim.keymap.set('n', '<leader>du', function() dap_view.toggle() end, { desc = "Toggle DAP View" })
    --         dap_view.setup(opts)
    --     end
    -- },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {},
        config = function(_, opts)
            require("nvim-dap-virtual-text").setup(opts)
        end
    }
}
