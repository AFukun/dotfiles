-- colorscheme
require('tokyonight').setup({
  style = 'night',
  styles = {
    keywords = {},
    floats = 'normal',
  },
  on_highlights = function(highlight, colors)
    highlight.TelescopeBorder = {
      bg = colors.bg_normal,
      fg = colors.fg_normal,
    }
  end,
})
vim.cmd.colorscheme('tokyonight')

-- treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'vim',
    'vimdoc',
    'python',
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
})

-- statusline
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { require('lsp-progress').progress },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { { 'filename', path = 1 } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    {
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { nil },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { nil },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      filetypes = { 'NvimTree' },
    },
  },
})

-- bufferline
-- require('bufferline').setup({
--   options = {
--     always_show_bufferline = false,
--     indicator = {
--       style = 'none',
--     },
--     max_prefix_length = 10,
--     diagnostics = 'nvim_lsp',
--     offsets = {
--       {
--         filetype = 'NvimTree',
--         text = '',
--         text_align = 'center',
--         separator = false,
--       },
--     },
--     show_close_icon = false,
--     show_buffer_close_icons = false,
--     show_duplicate_prefix = false,
--     separator_style = { '', '' },
--   },
-- })

-- indentline
require('ibl').setup({
  debounce = 50,
  scope = { enabled = false },
})