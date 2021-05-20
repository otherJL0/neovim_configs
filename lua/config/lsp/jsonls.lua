-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = {'json'},
  init_options = {
    provideFormatter = true,
  },
  settings = {
    json = {
      colorDecorators = {enable = true},
      format = { enable = true },
      schemaDownload = {
        enable = true
      },
      trace = {
        server = {'messages'}
      }
    }
  }
}
