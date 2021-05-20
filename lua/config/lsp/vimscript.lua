local vim_attach = function(client)
  require('completion').on_attach(client)
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
    ]], false
    )
  end
end

require('lspconfig').vimls.setup {
  cmd = { 'vim-language-server', '--stdio' },
  on_attach = vim_attach,
  filetypes = { 'vim' },
  init_options = {
    diagnostic = { enable = true },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
      runtimepath = true,
    },
    iskeyword = '@,48-57,_,192-255,-#',
    runtimepath = '',
    suggest = { fromRuntimepath = true, fromVimruntime = true },
    vimruntime = '',
  },
}
