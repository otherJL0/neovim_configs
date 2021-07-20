return {
  cmd = { 'pyright-langserver', '--stdio' },
  on_attach = {},
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
