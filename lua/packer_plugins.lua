vim.cmd [[packadd vimball]]

function has(x)
  return vim.fn.has(x) == 1
end

return require('packer').startup {
  function(use)
    -- Packer itself
    use 'wbthomas/packer.nvim'

    -- Essential Plugins
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'tjdevries/astronauta.nvim'
    use 'tjdevries/nlua.nvim'

    -- Useful Plugins
    use 'tami5/sql.nvim'
    use 'windwp/nvim-autopairs'

    -- Treesitter Plugins
    use {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-tree-docs',
      requires = 'nvim-treesitter/nvim-treesitter'
    }
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  }
}
