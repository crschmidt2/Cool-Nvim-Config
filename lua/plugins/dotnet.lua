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
            opts = {
                debugger = {
                    bin_path = netcoredbg_path,
                    mappings = {
                        open_variable_viewer = { lhs = "L", desc = "open variable viewer" },
                    },
                }
            },
            config = function(_, opts)
                require("easy-dotnet").setup(opts)
            end
        }
    }
}
