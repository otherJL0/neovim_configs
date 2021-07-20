return {
  filetypes = { 'dart' },
  init_options = {
    closingLabels = false,
    flutterOutline = false,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = false,
    suggestFromUnimportedLibraries = true,
  },
  root_dir = require('lspconfig.util').root_pattern('pubspec.yaml'),
}
