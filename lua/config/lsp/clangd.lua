return {
  cmd = { 'clangd', '--background-index' },
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  root_dir = require('lspconfig.util').root_pattern(
    'compile_commands.json',
    'compile_flags.txt',
    '.clangd'
  ),
}
