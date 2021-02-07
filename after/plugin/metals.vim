if has('nvim-0.5')
  augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(require('configs/lsp/metals').custom_init())
  augroup END
endif
