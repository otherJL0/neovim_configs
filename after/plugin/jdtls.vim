if has('nvim-0.5')
  augroup lsp
    au!
		au FileType java lua require('configs/lsp/jdtls_launch').setup()
  augroup end
endif



" `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"" use this mapping also with other language servers
"nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
"vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
"nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>
"
"nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
"nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
"vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
"vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
"
"
"command! -buffer JdtCompile lua require('jdtls').compile()
"command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
"command! -buffer JdtJol lua require('jdtls').jol()
"command! -buffer JdtBytecode lua require('jdtls').javap()
"command! -buffer JdtJshell lua require('jdtls').jshell()
"
"
"""au FileType java lua require('jdtls').start_or_attach({cmd = {'jdtls.sh'}, on_attach=require'completion'.on_attach(), root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml', '.git', 'gradle.build.kts'})})