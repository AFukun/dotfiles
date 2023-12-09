local util = require('formatter.util')
require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path ' .. vim.fn.stdpath('config') .. '/etc/stylua.toml',
            '-',
          },
          stdin = true,
        }
      end,
    },
    python = {
      function()
        return {
          exe = 'black',
          args = {
            '-l 120',
            '-q',
            '--stdin-filename ' .. util.escape_path(util.get_current_buffer_file_name()),
            '-',
          },
          stdin = true,
        }
      end,
    },
  },
  ['*'] = {
    require('formatter.filetypes.any').remove_trailing_whitespace,
  },
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    vim.cmd('FormatWrite')
  end,
})