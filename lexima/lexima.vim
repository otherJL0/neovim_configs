
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()  " force load lexima.vim and define mappings
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>" . lexima#expand('<CR>', 'i') :  lexima#expand('<LT>CR>', 'i')

" Latex custom rules
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'latex'})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'latex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'latex'})
