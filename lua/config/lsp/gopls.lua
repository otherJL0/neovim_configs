local go_attach = function(client)
    require('completion').on_attach(client)
    require('lsp-status').on_attach(client)
    require('lsp_signature').on_attach(client)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

require('lspconfig').gopls.setup {
    cmd = {"gopls"},
    on_attach = go_attach,
    filetypes = {"go", "gomod"},
    root_dir = require('lspconfig.util').root_pattern("go.mod", ".git")
}
