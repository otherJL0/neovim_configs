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
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  }
}
