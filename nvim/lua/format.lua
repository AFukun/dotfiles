-- formatter dependencies: stylua gofmt
require('formatter').setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    go = {
      require('formatter.filetypes.go').gofmt,
    },
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path ' .. vim.fn.stdpath 'config' .. '/etc/stylua.toml',
            '-',
          },
          stdin = true,
        }
      end,
    },
    python = {
      require('formatter.filetypes.python').black,
    },
    json = {
      require('formatter.filetypes.json').prettier,
    },
  },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.lua', '*.go', '*.py', '*.json' },
  callback = function()
    vim.cmd 'FormatWrite'
  end,
})
