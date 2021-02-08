lua require('packer_init')
lua require('plugins')

" Load plugin settings
lua require('configs/lsp/setup')
lua require('configs/treesitter/setup')
lua require('configs/telescope/setup')
lua require('configs/formatter/setup')
lua require('snippets/init')
lua require('nvim-autopairs').setup()
lua require('snippets').use_suggested_mappings()
" lua require('lspsaga').init_lsp_saga()
lua require('configs/lspsaga')
lua require('configs/lsp/metals')
lua require('configs/status/statusline')

set laststatus=2

set undofile
set undodir=~/.local/share/nvim/undo/

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
