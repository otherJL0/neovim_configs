let g:committia_hooks = {}

function! g:committia_hooks.edit_open(info)
  setlocal spell

  " If no commit message, start in insert mode
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  endif

  " Scroll through the diff window from insert mode
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

let g:committia_open_only_vim_starting=0
let g:committia_use_singlecolumn='always'
let g:committia_diff_window_opencmd='below split'
let g:committia_status_window_opencmd='right vsplit'
