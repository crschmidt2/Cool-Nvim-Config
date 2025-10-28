local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

--ONCE HEIRLINE GETS ITS CRUD TOGETHER
-- vim.diagnostic.config({
--     signs = {
--         text = {
--             [vim.diagnostic.severity.INFO] = '',
--             [vim.diagnostic.severity.HINT] = '',
--             [vim.diagnostic.severity.WARN] = '',
--             [vim.diagnostic.severity.ERROR] = '',
--         },
--         linehl = {
--             [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
--             [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
--             [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
--             [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError'
--         }
--     },
-- })
