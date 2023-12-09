local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- package manager
  { 'williamboman/mason.nvim' },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  -- autocomplete
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-path' },
  { 'dcampos/cmp-snippy' },
  { 'dcampos/nvim-snippy' },
  -- essentials
  { 'numToStr/Comment.nvim' },
  { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy' },
  -- filetree
  { 'nvim-tree/nvim-tree.lua', version = '*', lazy = false, dependencies = { 'nvim-tree/nvim-web-devicons' } },
  -- navigation
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'ThePrimeagen/harpoon', dependencies = { 'nvim-lua/plenary.nvim' } },
  -- formatter
  { 'mhartington/formatter.nvim' },
  -- lsp
  { 'neovim/nvim-lspconfig' },
  { 'linrongbin16/lsp-progress.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  -- theme
  { 'folke/tokyonight.nvim', lazy = false, opts = {} },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  -- { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
})