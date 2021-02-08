nnoremap <leader>v <cmd>CHADopen<cr>

let g:chadtree_settings = {"theme": {"icon_glyph_set": "ascii", "text_colour_set": "nerdtree_syntax_dark"}}

autocmd VimEnter * CHADopen --nofocus
