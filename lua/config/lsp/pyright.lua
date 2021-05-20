-- local nnoremap = vim.keymap.nnoremap
-- local pyright_attach = function(client)
--   require('completion').on_attach(client)
--   require('lsp-status').on_attach(client)
--   nnoremap { '<C-K>', vim.lsp.buf.hover }
--   if client.resolved_capabilities.document_highlight then
--     vim.api.nvim_exec(
--         [[
--       hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--       hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--       hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]], false
--     )
--   end
-- end
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
