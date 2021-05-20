local go_attach = function(client)
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
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end
end

require('lspconfig').gopls.setup {
  -- cmd = {"gopls", "serve"},
  cmd = { 'gopls', '--remote=auto' },
  on_attach = go_attach,
  filetypes = { 'go', 'gomod' },
  root_dir = require('lspconfig.util').root_pattern('go.mod', '.git'),
  capabilities = {
    textDocument = { completion = { completionItem = { snippetSupport = true } } },
  },
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = true,
        generate = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
        test = true,
      },
      semanticTokens = true,
      usePlaceholders = true,
      matcher = 'CaseSensitive',
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        fieldalignment = true,
        nilness = true,
        shadow = true,
      },

      staticcheck = true,
      annotations = { bounds = true, escape = true, inline = true },
      hoverKind = 'FullDocumentation',
      linkTarget = 'pkg.go.dev',
      linksInHover = true,
      importShortcut = 'Both',
      symbolMatcher = 'CaseSensitive',
      symbolStyle = 'Dynamic',
    },
  },
}
