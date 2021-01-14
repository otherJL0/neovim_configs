" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
set completeopt+=noinsert,menuone,preview


" Avoid showing message extra message when using completion
set shortmess+=c
" let g:completion_enable_auto_popup = 0


imap <tab> <Plug>(completion_smart_tab)        
imap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_trigger_keyword_length = 3 " default = 1


" Setup snippet support
let g:completion_enable_snippet = 'snippets.vim'
  
" Configure the completion chains
let g:completion_auto_change_source = 1

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
