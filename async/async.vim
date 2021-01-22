function! s:run_in_floaterm(opts)
  execute 'FloatermNew --position=center' .
                   \ ' --wintype=float' .
                   \ ' --height=0.6' .
                   \ ' --width=0.6' .
                   \ ' --title=floaterm_runner' .
                   \ ' --autoclose=0' .
                   \ ' --silent=' . get(a:opts, 'silent', 0)
                   \ ' --cwd=' . a:opts.cwd
                   \ ' ' . a:opts.cmd
  " Do not focus on floaterm window, and close it once cursor moves
  " If you want to jump to the floaterm window, use <C-w>p
  " You can choose whether to use the following code or not
  stopinsert | noa wincmd p
  augroup close-floaterm-runner
    autocmd!
    autocmd CursorMoved,InsertEnter * ++nested
          \ call timer_start(100, { -> s:close_floaterm_runner() })
  augroup END
endfunction
function! s:close_floaterm_runner() abort
  if &ft == 'floaterm' | return | endif
  for b in tabpagebuflist()
    if getbufvar(b, '&ft') == 'floaterm' &&
          \ getbufvar(b, 'floaterm_jobexists') == v:false
      execute b 'bwipeout!'
      break
    endif
  endfor
  autocmd! close-floaterm-runner
endfunction
let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:run_in_floaterm')
let g:asynctasks_term_pos = 'floaterm'

let g:asyncrun_open = 6

nnoremap <Leader>Fr :AsyncTask file-run<cr>
nnoremap <Leader>Fb :AsyncTask file-build<cr>

nnoremap <Leader>Pr :AsyncTask project-run<cr>
nnoremap <Leader>Pb :AsyncTask project-build<cr>

nnoremap <Leader>Gr :AsyncTask gradle<cr>
