if vim.fn.executable('stylua') == 0 then
  return
end

vim.cmd([[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require('sty').format()
  augroup END
]])
