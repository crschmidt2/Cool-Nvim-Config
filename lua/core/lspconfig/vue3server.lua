--local volarPath = vim.fn.stdpath("data") ..
    --"/mason/packages/typescript-language-server/node_modules/typescript/lib"

--require'lspconfig'.volar.setup{
  --init_options = {
    --typescript = {
      --tsdk = volarPath
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    --}
  --}
--}
--

local volarPath = vim.fn.stdpath("data") ..
    "/mason/packages/typescript-language-server/node_modules/typescript/lib"

require'lspconfig'.volar.setup{
  init_options = {
    typescript = {
      tsdk = volarPath
    }
  }
}

