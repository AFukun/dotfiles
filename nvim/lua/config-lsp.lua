local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_init = function(client)
    local cwd = vim.fn.getcwd()
    if vim.loop.fs_stat(cwd .. '/init.lua') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file('', true),
          },
          diagnostics = {
            disable = { 'missing-fields', 'undefined-field' },
          },
        },
      })
      client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end
    return true
  end,
})

lspconfig.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
      },
    },
  },
})

require('lsp-progress').setup({
  client_format = function(client_name, spinner, series_messages)
    if #series_messages == 0 then
      return nil
    end
    return {
      name = client_name,
      body = spinner .. ' ' .. table.concat(series_messages, ', '),
    }
  end,
  format = function(client_messages)
    local function stringify(name, msg)
      return msg and string.format('%s %s', name, msg) or name
    end

    local sign = ''
    local lsp_clients = vim.lsp.get_active_clients()
    local messages_map = {}
    for _, climsg in ipairs(client_messages) do
      messages_map[climsg.name] = climsg.body
    end

    if #lsp_clients > 0 then
      table.sort(lsp_clients, function(a, b)
        return a.name < b.name
      end)
      local builder = {}
      for _, cli in ipairs(lsp_clients) do
        if type(cli) == 'table' and type(cli.name) == 'string' and string.len(cli.name) > 0 then
          if messages_map[cli.name] then
            table.insert(builder, stringify(cli.name, messages_map[cli.name]))
          else
            table.insert(builder, stringify(cli.name))
          end
        end
      end
      if #builder > 0 then
        return sign .. ' ' .. table.concat(builder, ', ')
      end
    end
    return ''
  end,
})