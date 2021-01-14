set colorcolumn=80
if has('nvim') || has('termguicolors')
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
  set t_Co=256
endif

let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_transparent_background = 1

let g:sonokai_diagnostic_line_hightlight = 1
"let g:sonokai_current_word = 'bold'

colorscheme sonokai
