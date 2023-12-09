vim.opt.completeopt = 'menu,menuone,noselect'

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, { 'i', 'c' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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
    -- ['<C-j>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 'c' }),
    -- ['<C-k>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 'c' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

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