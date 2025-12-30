-- local utils = require("lib.utils")

return {
    {
        "yetone/avante.nvim",
        enabled = false,
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        version = false,
        keys = {
            { '<leader>as', '<cmd>AvanteAsk<CR>',     desc = 'Open avante ask window' },
            { '<leader>an', '<cmd>AvanteChatNew<CR>', desc = 'Open new avante chat window' },
            { '<leader>am', '<cmd>AvanteModels<CR>',  desc = 'Open avante models' },
        },
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            mode = "agentic", --legacy or agentic
            instructions_file = "avante.md",
            provider = "copilot",
            mappings = {
                submit = {
                    normal = "<CR>",
                    insert = "<C-s>"
                }
            },
            windows = {
                ask = {
                    floating = false,
                    start_insert = false,
                }
            },
            prompt_logger = {
                enabled = false
            },

        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "folke/snacks.nvim",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            'MeanderingProgrammer/render-markdown.nvim'
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        cond = true,
        keys = {
            { '<leader>as', '<cmd>CopilotChatToggle<CR>', desc = 'Open copilot chat window' },
            { '<leader>ar', '<cmd>CopilotChatReset<CR>', desc = 'Reset copilot chat window' },
        },
        dependencies = {
            { "nvim-lua/plenary.nvim",        branch = "master" },
            { "nvim-telescope/telescope.nvim" }
        },
        opts = {
            model = 'gpt-4o',
            window = { width = 80 },
            --This was hard af to find (had to look at commits), so don't delete unless necessary lol
            mappings = { reset = "" },
        },
        config = function(_, opts)
            require("CopilotChat").setup(opts)
        end
    },
}
