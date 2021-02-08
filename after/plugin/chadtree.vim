nnoremap <leader>v <cmd>CHADopen<cr>

" let g:chadtree_settings = {"theme": { "icon_glyph_set": "ascii", "text_colour_set": "nerdtree_syntax_dark" }, "view": { "width": 30, }, "window_options": { "relativenumber": true, "signcolumn": "yes"} }
let g:chadtree_settings = {"theme": { "icon_glyph_set": "ascii", "text_colour_set": "nerdtree_syntax_dark" }, "view": { "width": 30 }}

autocmd VimEnter * CHADopen --nofocus
