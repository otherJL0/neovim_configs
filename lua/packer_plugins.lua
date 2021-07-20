return require('packer').startup {
  function(use)
    -- Packer itself
    use 'wbthomas/packer.nvim'

    -- Essential Plugins
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'nvim-treesitter/nvim-treesitter'
    use 'tjdevries/astronauta.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'tjdevries/express_line.nvim'
    use 'mfussenegger/nvim-dap'
    use 'liuchengxu/vista.vim'
    -- Lua
    use 'folke/which-key.nvim'

    -- Useful Plugins
    use 'tami5/sql.nvim'
    use 'windwp/nvim-autopairs'

    -- Treesitter Plugins
    use {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-tree-docs',
      requires = 'nvim-treesitter/nvim-treesitter',
    }

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    -- Git Plugins
    use 'lewis6991/gitsigns.nvim'
    -- Customization
    use 'folke/tokyonight.nvim'
    use 'b3nj5m1n/kommentary'
    use 'kyazdani42/nvim-web-devicons'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } },
    }

    -- SQL
    use 'nanotee/sqls.nvim'

    use 'unblevable/quick-scope'

    use 'folke/trouble.nvim'
    use 'gennaro-tedesco/nvim-jqx'
    use 'kevinhwang91/nvim-hlslens'
    use 'windwp/nvim-ts-autotag'
    use 'monaqa/dial.nvim'
    use 'jbyuki/one-small-step-for-vimkind'
    use 'romgrk/barbar.nvim'
    use 'rafcamlet/nvim-luapad'
    use 'f-person/git-blame.nvim'
    use 'sindrets/diffview.nvim'
    use 'tpope/vim-fugitive'
    use 'tmux-plugins/vim-tmux'

    use 'folke/lua-dev.nvim'
    use 'scalameta/nvim-metals'
    use 'mfussenegger/nvim-jdtls'
    use {
      'folke/twilight.nvim',
      config = function()
        require('twilight').setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end,
    }
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'vhyrro/neorg'
  end,
  config = { display = { open_fn = require('packer.util').float } },
}

