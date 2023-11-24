-- color theme
local mirage = true
local colors = require 'ayu.colors'
colors.generate(mirage)
require('ayu').setup {
  mirage = mirage,
  overrides = {
    MatchParen = { fg = colors.bg, bg = colors.fg },
    Search = { bg = colors.selection_inactive },
    CursorLineNr = { fg = colors.accent, bg = colors.bg },
    EndOfBuffer = { fg = colors.bg },
    VertSplit = { fg = colors.bg },
    StatusLine = { bg = colors.bg },
    StatusLineNC = { fg = colors.bg, bg = colors.bg },
  },
}
require('ayu').colorscheme()

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'json',
    'lua',
    'toml',
    'go',
    'gomod',
    'vim',
  },
  highlight = { enable = true },
}

-- statusline
-- TODO: relative directory&&filename
local lualine_ayu = {
  visual = {
    a = { fg = colors.bg, bg = colors.accent, gui = 'bold' },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.markup, gui = 'bold' },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.string, gui = 'bold' },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.entity, gui = 'bold' },
    b = { fg = colors.entity, bg = colors.panel_shadow },
    c = { fg = colors.fg, bg = colors.bg },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = lualine_ayu,
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'lsp_progress' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
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
      filetypes = { 'NvimTree', 'Trouble' },
    },
  },
}

-- bufferline
require('bufferline').setup {
  options = {
    always_show_bufferline = false,
    indicator = {
      style = 'none',
    },
    max_prefix_length = 10,
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = '',
        text_align = 'center',
        separator = false,
      },
    },
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_duplicate_prefix = false,
    separator_style = { '', '' },
  },
  highlights = {
    fill = {
      bg = colors.panel_shadow,
    },
    background = {
      bg = colors.panel_shadow,
    },
  },
}

-- indentline
-- vim.opt.listchars = {
--   tab = '|',
--   trail = ' ',
-- }
require("ibl").setup()
