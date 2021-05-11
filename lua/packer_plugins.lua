vim.cmd [[packadd vimball]]

function has(x) return vim.fn.has(x) == 1 end

return require('packer').startup {
    function(use)
        -- Packer itself
        use 'wbthomas/packer.nvim'

        -- Essential Plugins
        -- use 'nvim-lua/plenary.nvim'
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/completion-nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'tjdevries/astronauta.nvim'
        use 'tjdevries/nlua.nvim'
        use 'nvim-lua/lsp-status.nvim'
        use 'nvim-lua/lsp_extensions.nvim'
        use 'tjdevries/express_line.nvim'
        use 'glepnir/lspsaga.nvim'

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

        -- Snippets
        use 'norcalli/snippets.nvim'

        -- Git Plugins
        use 'lewis6991/gitsigns.nvim'
        -- Customization
        use 'folke/tokyonight.nvim'
        use 'tjdevries/colorbuddy.nvim'
        use 'tjdevries/gruvbuddy.nvim'
        use 'b3nj5m1n/kommentary'

        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
        }

        use "folke/trouble.nvim"
    end,
    config = {display = {open_fn = require('packer.util').float}}
}
