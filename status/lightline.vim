" 90 can be any length
" module->expression_statement->call->identifier
" echo nvim_treesitter#statusline(90)  

set laststatus=2

let g:lightline = {
      \ 'active': {
      \   'left': [ ['mode', 'paste', 'readonly'  ],
      \             [ 'filename', 'gitbranch', 'modified' ] ] ,
      \   'right': [ [ 'csv', 'percent', 'lineinfo'  ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'lspstatus' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'lspstatus': 'LspStatus',
      \   'csv' : 'CSV_WCol'
      \ },
      \ }

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

let g:lightline.colorscheme = 'sonokai'
