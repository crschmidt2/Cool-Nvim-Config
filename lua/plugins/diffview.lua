return {
    "sindrets/diffview.nvim",
    keys = {
        {
            '<leader>dv',
            function()
                local branches = vim.fn.systemlist({ "git", "branch", "-a", "--format=%(refname:short)" })
                if vim.v.shell_error ~= 0 then
                    vim.notify("not in a git repo", vim.log.levels.ERROR)
                    return
                end
                branches = vim.tbl_filter(function(b)
                    return b ~= "" and not b:match("^origin/HEAD")
                end, branches)
                vim.ui.select(branches, { prompt = "target branch: " }, function(target)
                    if not target then return end
                    vim.cmd("DiffviewOpen " .. target .. "...HEAD --imply-local")
                end)
            end,
            desc = 'Open diffview between current head and target branch'
        },
        { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Close diffview' },
    },
    opts = function()
        local actions = require("diffview.actions")
        return {
            keymaps = {
                -- <Tab> and <C-i> are the same byte in the terminal, so diffview's
                -- default <tab> mapping eats the jumplist-forward motion. Drop it in
                -- the diff buffers and put next/prev entry on leader keys instead.
                view = {
                    { "n", "<tab>", false },
                    -- { "n", "<leader>dn", actions.select_next_entry, { desc = "Diff for the next file" } },
                    -- { "n", "<leader>dp", actions.select_prev_entry, { desc = "Diff for the previous file" } },
                },
            },
        }
    end,
}
