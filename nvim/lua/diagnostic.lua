vim.diagnostic.config {
  virtual_text = { spacing = 4 },
  signs = false,
  underline = false,
}

require('trouble').setup {
  height = 12,
  icons = true,
  fold_open = '',
  fold_closed = '',
  indent_lines = false,
  padding = false,
  action_keys = {
    close = { '<esc>' },
    cancel = {},
    refresh = 'r',
    jump = {},
    open_split = {},
    open_vsplit = {},
    open_tab = {},
    jump_close = { '<cr>' },
    toggle_mode = {},
    toggle_preview = {},
    hover = 'f',
    preview = {},
    close_folds = {},
    open_folds = {},
    toggle_fold = {},
    previous = 'k',
    next = 'j',
  },
  signs = {
    error = '',
    warning = '',
    hint = '',
    information = '',
  },
}

-- vim.cmd [[au FileType Trouble setlocal nocursorline]]
