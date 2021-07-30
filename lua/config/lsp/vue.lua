local vue_attach = function(client)
  require('lsp-status').on_attach(client)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end
require('lspconfig').vuels.setup({
  cmd = { 'vls' },
  on_attach = vue_attach,
  filetypes = { 'vue' },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = { suggest = {} },
      javascript = { format = {} },
      stylusSupremacy = {},
      typescript = { format = {} },
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = 'kebab',
          useScaffoldSnippets = true,
        },
        format = {
          defaultFormatter = { js = 'none', ts = 'none' },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false,
        },
        useWorkspaceDependencies = false,
        validation = { script = true, style = true, template = true },
      },
    },
  },
})
