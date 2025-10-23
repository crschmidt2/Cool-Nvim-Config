local utils = require("lib.utils")

return {
    {
        "yetone/avante.nvim",
        enabled = function()
            return not utils.is_on_windows()
        end,
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false,
        keys = {
            { '<leader>as', '<cmd>AvanteAsk<CR>',     desc = 'Open avante ask window' },
            { '<leader>an', '<cmd>AvanteChatNew<CR>', desc = 'Open new avante chat window' },
        },
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            instructions_file = "avante.md",
            provider = "copilot",
            mappings = {
                ask = "<leader>as"
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
    }
}
