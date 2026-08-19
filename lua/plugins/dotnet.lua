--===================DISCLAIMER===================
--Requirements:
--EasyDotNet (in $PATH probably): 'dotnet tool install -g EasyDotNet'
--jq
-- local utils = require('lib.utils')
-- local function insert_summary_comment(isBelow)
--     local target_comment_row = vim.api.nvim_win_get_cursor(0)[1] - 1
--
--     if (isBelow) then
--         target_comment_row = target_comment_row + 1
--     end
--
--     local lines = { "/// <summary>", "/// ", "/// </summary>" }
--     vim.api.nvim_buf_set_lines(0, target_comment_row, target_comment_row, false, lines)
--     vim.lsp.buf.format()
--
--     local row = vim.api.nvim_win_get_cursor(0)[1]
--     local target_row
--     if (isBelow) then
--         target_row = row + 2
--     else
--         target_row = row - 2
--     end
--     vim.api.nvim_win_set_cursor(0, { target_row, vim.v.maxcol })
--     vim.api.nvim_input("a")
-- end

local utils = require('lib.utils')

local html_ls_path = utils.get_mason_bin_file_path('vscode-html-language-server')

return
{
    {
        {
            "GustavEikaas/easy-dotnet.nvim",
            dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
            ft = { "cs", "sln", "csproj" },
            cmd = { "Dotnet new", "Dotnet createfile" },
            opts = {
                lsp = {
                    --     enabled = false,
                    --     -- roslynator_enabled = false,
                    --     -- bin_path = roslyn_path,
                    --     -- analyzer_assemblies = {},
                    razor = {
                        -- enabled = true,
                        html = {
                            enabled = true,
                            -- cmd = html_ls_path, -- Uses Mason
                            request_timeout = 5000,
                        },
                    },
                },
                -- debugger = {
                --     bin_path = netcoredbg_path,
                --     -- mappings = {
                --     --     open_variable_viewer = { lhs = "T", desc = "open variable viewer" },
                --     -- },
                -- }
            },
            config = function(_, opts)
                require("easy-dotnet").setup(opts)

                --NOTE: These should be handled by the LSP Code Actions when typing a triple slash comment above a method.
                -- vim.keymap.set("n", "<leader>tsk", function()
                --     insert_summary_comment(false)
                -- end, { desc = "Create summary comment above cursor" })
                --
                --
                -- vim.keymap.set("n", "<leader>tsj", function()
                --     insert_summary_comment(true)
                -- end, { desc = "Create summary comment below cursor" })
            end
        }
    }
}
