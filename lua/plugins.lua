-- Required since packer is in 'opt' pack:
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  use {'neovim/nvim-lspconfig'}

  -- Treesitter Plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-tree-docs',
    'nvim-treesitter/playground',
    requires = {'nvim-treesitter/nvim-treesitter'}
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



end)
