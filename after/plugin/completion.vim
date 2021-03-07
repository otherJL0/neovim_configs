" Set completeopt to have a better completion experience
" :help completeopt
" menuone: show menu even when only one option
" noinsert: Do not insert text until a selection is made
" noselct: Force user to select one from the menu

set completeopt+=noinsert,menuone,preview,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" let g:completion_enable_auto_popup = 0

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" let g:completion_confirm_key = "\<C-y>"
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_trigger_keyword_length = 3 " default = 1


" Setup snippet support
let g:completion_enable_snippet = 'snippets.nvim'

" " Configure the completion chains
" let g:completion_auto_change_source = 1
