vim.opt.completeopt = 'menu,menuone,noselect'

local cmp = require 'cmp'

local mapping = {
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      local entry = cmp.get_selected_entry()
      if not entry then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
      else
        fallback()
      end
    else
      fallback()
    end
  end, { 'i', 'c' }),
  ['<CR>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      local entry = cmp.get_selected_entry()
      if entry then
        cmp.confirm()
      else
        fallback()
      end
    else
      fallback()
    end
  end, { 'i', 'c' }),
  ['<C-e>'] = cmp.mapping(cmp.abort, { 'i', 'c' }),
  ['<C-j>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
    else
      fallback()
    end
  end, { 'i', 'c' }),
  ['<C-k>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
    else
      fallback()
    end
  end, { 'i', 'c' }),
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = mapping,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
}

cmp.setup.cmdline({ '/', '?' }, {
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' },
    { name = 'path' },
  },
})
