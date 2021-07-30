local zetapath = vim.fn.stdpath('cache') .. '/zeta-note'
return {
  cmd = { zetapath },
  filetypes = { 'markdown', 'vimwiki', 'md' },
  -- settings = {
  -- zetaNote = {
  -- customCommand = '',
  -- customCommandDir = '',
  -- trace = {
  -- server = "verbose"
  -- }
  -- }
  -- }
}
