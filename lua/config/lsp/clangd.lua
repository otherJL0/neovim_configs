local clangd_attach = function(client)
  require('completion').on_attach(client)
  require('lsp-status').on_attach(client)
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
    ]], false
    )
  end
end
require'lspconfig'.clangd.setup {
  cmd = { 'clangd', '--background-index' },
  on_attach = clangd_attach,
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  root_dir = require('lspconfig.util').root_pattern(
      'compile_commands.json', 'compile_flags.txt'
  ),
}

