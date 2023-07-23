require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--fixed-strings',
      '--no-ignore-vcs',
    },
    file_ignore_patterns = { '.git/', '__pycache__' },
    layout_strategy = 'vertical',
    scroll_strategy = nil,
    layout_config = {
      vertical = {
        width = 0.95,
        height = 0.95,
        preview_height = 0.5,
        preview_cutoff = 30,
      },
    },
    mappings = {
      i = {
        ['<C-n>'] = false,
        ['<C-p>'] = false,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = {
        'fd',
        '-t=f',
        '-F',
        '-E=.git',
      },
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          width = 0.95,
          height = 0.95,
          preview_width = 0.6,
        },
      },
    },
  },
}
