--===================DISCLAIMER===================
--Requirements:
--EasyDotNet (in $PATH probably): 'dotnet tool install -g EasyDotNet'
--jq
local utils = require('lib.utils')
local netcoredbg_path = utils.get_mason_bin_file_path('netcoredbg')

return {
    {
        {
            "GustavEikaas/easy-dotnet.nvim",
            dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
            ft = { "cs", "sln", "csproj" },
            opts = {
                lsp = {
                    enabled = false,
                    roslynator_enabled = true,
                    analyzer_assemblies = {},
                },
                debugger = {
                    bin_path = netcoredbg_path,
                    -- mappings = {
                    --     open_variable_viewer = { lhs = "T", desc = "open variable viewer" },
                    -- },
                }
            },
            config = function(_, opts)
                require("easy-dotnet").setup(opts)
            end
        }
    }
}
