return {
  cmd = { 'srb', 'tc', '--lsp' },
  filetypes = { 'ruby' },
  root_dir = require('lspconfig.util').root_pattern('README.md'),
}
