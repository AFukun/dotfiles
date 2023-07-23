require('nvim-tree').setup {
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  system_open = {
    cmd = 'open',
  },
  trash = {
    cmd = 'trash',
  },
  filters = {
    custom = { '.git$', '.DS_Store', 'node_modules$', '__pycache__$' },
  },
  git = {
    ignore = false,
  },
  view = {
    mappings = {
      custom_only = true,
      list = {
        { key = '<cr>', action = 'edit' },
        { key = '<C-v>', action = 'vsplit' },
        { key = '<C-x>', action = 'split' },
        { key = '<', action = 'prev_sibling' },
        { key = '>', action = 'next_sibling' },
        { key = 'P', action = 'parent_node' },
        { key = 'I', action = 'toggle_ignored' },
        { key = 'R', action = 'refresh' },
        { key = 'q', action = 'close' },
        { key = 'a', action = 'create' },
        { key = 'D', action = 'remove' },
        { key = 'd', action = 'trash' },
        { key = 'r', action = 'rename' },
        { key = 'x', action = 'cut' },
        { key = 'c', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'o', action = 'system_open' },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
}
