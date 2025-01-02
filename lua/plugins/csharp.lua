-- There is currently a bug with this that makes it so you can't insert opts. I need to change the cmd_path to get the app to work on windows, so
-- until this is fixed I can't use it

return {
--   "iabdelkareem/csharp.nvim",
--   ft = {
--     "cs"
--   },
--   dependencies = {
--     "williamboman/mason.nvim", -- Required, automatically installs omnisharp
--     "mfussenegger/nvim-dap",
--     "Tastyep/structlog.nvim",  -- Optional, but highly recommended for debugging
--   },
--   config = function()
--     require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
--     require("csharp").setup(
--       {
--         lsp = {
--           omnisharp = {
--             cmd_path = omnisharpPath
--             -- cmd_path = nil
--           }
--         }
--       }
--     )
--   end
}
