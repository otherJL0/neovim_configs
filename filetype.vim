if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *hcl     setfiletype terraform
  au! BufRead,BufNewFile *tf.json setfiletype terraform
augroup END
