-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end,
    },
  },
  filetypes = { 'json' },
  init_options = { provideFormatter = true },
  settings = {
    json = {
      colorDecorators = { enable = true },
      format = { enable = true },
      schemaDownload = { enable = true },
      trace = { server = { 'messages' } },
    },
  },
}
