" Load general vim settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim

" Load plugins
lua require('packer_init')
lua require('plugins')

" Load plugin settings
lua require('configs/lsp/setup')
lua require('configs/treesitter/setup')
lua require('configs/telescope/setup')

source $HOME/.config/nvim/telescope/mappings.vim
source $HOME/.config/nvim/status/lsp_status.vim
source $HOME/.config/nvim/status/barbar.vim
source $HOME/.config/nvim/status/lightline.vim
source $HOME/.config/nvim/general/colorscheme.vim
source $HOME/.config/nvim/tabline/barbar.vim
source $HOME/.config/nvim/file_manager/chadtree.vim
source $HOME/.config/nvim/vimwiki/vimwiki.vim
source $HOME/.config/nvim/quickscope/quickscope.vim
source $HOME/.config/nvim/chadtree/chadtree.vim


if has('nvim-0.5')
  augroup lsp
    au!
      au FileType java lua require('jdtls').start_or_attach({cmd = {'/home/jlopez/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls/eclipse-jdt-ls'}})
  augroup end
endif
