syntax enable                           " Enables syntax highlighing

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC


" Auto reload vim when updating any config file
au BufWritePost ~/.config/nvim/** so $MYVIMRC


" Auto whitespace trimming
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


" Escape vim terminal using <ESC>
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif


" Only enable syntax once to prevent overwriting
if !exists("g:syntax_on")
        syntax enable
endif


" Highlight yanked text
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Only enable relative line numbers in normal mode
augroup AutoRelativeLineNums
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
