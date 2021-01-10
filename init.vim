" Load general vim settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim

" Load plugins
lua require('packer_init')
lua require('plugins')

" Load plugin settings
lua require('configs/lsp')
lua require('configs/treesitter')
lua require('configs/telescope')
