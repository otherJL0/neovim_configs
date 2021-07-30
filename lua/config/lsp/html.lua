-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local html_attach = function(client)
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

require('lspconfig').html.setup({
  cmd = { 'html-languageserver', '--stdio' },
  on_attach = html_attach,
  filetypes = { 'html' },
  init_options = {
    configurationSection = { 'html', 'css', 'javascript' },
    embeddedLanguages = { css = true, javascript = true },
  },
  capabilities = capabilities,
})
