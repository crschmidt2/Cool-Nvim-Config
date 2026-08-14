return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = {
            -- { "<leader>zm", "<cmd>ZenMode<CR>", desc = "Toggle zen mode" } },
            { "<leader>zm", desc = "Toggle zen mode" } },
        dependencies = {
            {
                "folke/twilight.nvim",
                opts = {
                    -- Use :InspectTree to get the treesitter name for what you want to highlight. Highest ancestor in the tree gets highlighted
                    -- expand = {
                    --     "function",
                    --     "method",
                    --     "table",
                    --     "if_statement",
                    -- }
                }
            },
            "lewis6991/gitsigns.nvim"
        },
        opts = {
            window = {
                backdrop = 0.8,
                width = 140,
                options = {
                    signcolumn = "no"
                }
            },
            plugins = {
                gitsigns = { enabled = true },
                todo = { enabled = false }
            },
            on_open = function(_)
                local gs = require("gitsigns")

                gs.toggle_current_line_blame(false)
                gs.detach()
            end,
            on_close = function()
                local gs = require("gitsigns")

                gs.toggle_current_line_blame(true)
                gs.attach()
                gs.refresh()
            end
        },
        config = function(_, opts)
            local zm = require("zen-mode")

            local is_active = function()
                local is_open = require("zen-mode.view").is_open()

                return is_open ~= nil
            end

            local activate = function()
                if not is_active()
                then
                    zm.toggle()
                end
            end

            local deactivate = function()
                local zen_buf = vim.api.nvim_get_current_buf()

                zm.toggle()

                local current_buf = vim.api.nvim_get_current_buf()

                if current_buf == zen_buf then
                    return
                end


                vim.api.nvim_set_current_buf(zen_buf)
            end

            local toggle = function()
                if is_active() then
                    deactivate()
                else
                    activate()
                end
            end

            vim.keymap.set('', '<leader>zm', toggle)

            zm.setup(opts)
        end
    },
}
