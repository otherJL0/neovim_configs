nnoremap <leader>v <cmd>CHADopen<cr>

" let g:chadtree_settings = {"theme": { "icon_glyph_set": "ascii", "text_colour_set": "nerdtree_syntax_dark" }, "view": { "width": 30, }, "window_options": { "relativenumber": true, "signcolumn": "yes"} }
let g:chadtree_settings = {
      \ "theme": 
      \ { 
      \   "icon_glyph_set": "ascii",
      \   "text_colour_set": "nerdtree_syntax_dark" 
      \ },
      \ "view": { 
      \ "width": 30,
      \ "window_options": {
      \   "relativenumber" : v:true,
      \  }
      \ }
      \}
" let g:chadtree_settings = {"view.window_options.relativenumber": v:true}

autocmd VimEnter * CHADopen --nofocus
