-- quick scope
vim.api.nvim_set_hl(0, 'QuickScopePrimary', { underline = true })
vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { underline = true })
vim.g.qs_highlight_on_keys = { 'f', 'F' }

-- colorizer
require('colorizer').setup {
  'lua',
  'vim',
}

-- installter
require('mason').setup()

-- commenter
require('Comment').setup()

-- surrounder
require('nvim-surround').setup()
