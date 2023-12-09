require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    -- lsp
    'lua-language-server',
    'python-lsp-server',
    -- formatter
    'black',
    'stylua',
  },
})