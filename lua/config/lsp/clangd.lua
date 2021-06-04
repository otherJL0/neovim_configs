return {
  cmd = { 'clangd', '--background-index' },
  on_attach = clangd_attach,
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  root_dir = require('lspconfig.util').root_pattern('compile_commands.json',
                                                    'compile_flags.txt'),
}

