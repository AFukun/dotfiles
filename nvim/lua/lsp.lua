local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- LSP dependencies: gopls
-- require('lspconfig').gopls.setup {
--   capabilities = capabilities,
--   cmd = { 'gopls', 'serve' },
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
-- }
