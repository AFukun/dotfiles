require('packer').init {
  compile_path = vim.fn.stdpath 'data' .. '/plugin/packer_compiled.lua',
}

return require('packer').startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  -- appearance
  use 'Shatur/neovim-ayu'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
    },
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  }
  use 'lukas-reineke/indent-blankline.nvim'

  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- lsp
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  }

  -- diagnostic
  use {
    'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- formatter
  use 'mhartington/formatter.nvim'

  -- utilities
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'gpanders/editorconfig.nvim'
  use 'unblevable/quick-scope'
  use 'norcalli/nvim-colorizer.lua'
end)
