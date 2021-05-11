local pyright_attach = function(client)
  require('completion').on_attach()
end

require('lspconfig').pyright.setup {
  cmd = { "pyright-langserver", "--stdio" },
  on_attach = pyright_attach,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true
      }
    }
  }
}
