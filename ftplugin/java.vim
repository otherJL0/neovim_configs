autocmd FileType java iabbr <buffer> jutil import java.util.
autocmd FileType java iabbr <buffer> Exc Exception
autocmd FileType java iabbr <buffer> exc Exception
autocmd FileType java iabbr <buffer> priv private
autocmd FileType java iabbr <buffer> pub public
autocmd FileType java iabbr <buffer> str String
autocmd FileType java iabbr <buffer> bool boolean
autocmd FileType java iabbr <buffer> dbl double
autocmd FileType java iabbr <buffer> fin final
autocmd FileType java iabbr <buffer> pkg package
autocmd FileType java iabbr <buffer> oride @Override
autocmd FileType java iabbr <buffer> cont continue
autocmd FileType java iabbr <buffer> impl implements
autocmd FileType java iabbr <buffer> inter interface
autocmd FileType java iabbr <buffer> sync synchronized
autocmd FileType java iabbr <buffer> tran transient
autocmd FileType java iabbr <buffer> vol volatile
lua require('configs/lsp/jdtls_launch').setup()
