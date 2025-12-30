--TODO: Make this use treesitter or commenting plugin instead of hardcoding double slashes
local function insert_comment(keyword, isBelow)
    local row = vim.api.nvim_win_get_cursor(0)[1]
    if (isBelow) then
        row = row + 1
    end

    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "//" .. keyword .. ":" })
end

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            REVIEWED = { icon = "", },
            TESTED = { icon = "", color = "warning", },
        },
        highlight = {
            multiline = false,
        },
    },
    config = function(_, opts)
        require("todo-comments").setup(opts)

        vim.keymap.set("n", "<leader>trj", function()
            insert_comment("REVIEWED", true)
        end, { desc = "Insert REVIEWED comment below" })

        vim.keymap.set("n", "<leader>trk", function()
            insert_comment("REVIEWED", false)
        end, { desc = "Insert REVIEWED comment above" })

        vim.keymap.set("n", "<leader>ttj", function()
            insert_comment("TESTED", true)
        end, { desc = "Insert TESTED comment below" })

        vim.keymap.set("n", "<leader>ttk", function()
            insert_comment("TESTED", false)
        end, { desc = "Insert TESTED comment above" })
    end
}
