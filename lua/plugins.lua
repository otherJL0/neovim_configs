-- Required since packer is in 'opt' pack:
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP Plugins
  use {
    'neovim/nvim-lspconfig',
    'mattn/vim-lsp-settings',
    'mfussenegger/nvim-jdtls',
    'scalameta/nvim-metals',
    'nvim-lua/completion-nvim',
    'norcalli/snippets.nvim',
    'nvim-lua/lsp-status.nvim',
  }

  -- Treesitter Plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-tree-docs',
    'nvim-treesitter/playground',
    requires = {'nvim-treesitter/nvim-treesitter'}
  }

  -- Debug Adapter Protocol
  use {
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    'nvim-telescope/telescope-dap.nvim',
    requires = {'mfussenegger/nvim-dap'}
  }



  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-packer.nvim',
    requires = { 'nvim-telescope/telescope.nvim' }
  }

  -- Dadbod SQL plugins
  use {
    'kristijanhusak/vim-dadbod-ui',
    requires = {{'tpope/vim-dadbod'}, {'kristijanhusak/vim-dadbod-completion'}}
  }

  use 'cohama/lexima.vim'
  use 'mhinz/vim-signify'
  use 'itchyny/lightline.vim'
  use 'sainnhe/sonokai'
  use 'romgrk/barbar.nvim'
  use 'ms-jpq/chadtree'


end)
