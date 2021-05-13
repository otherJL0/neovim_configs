local chain_complete_list = {
    default = {
        {complete_items = {'lsp', 'snippet'}},
        {complete_items = {'path'}, triggered_only = {'/'}},
        {complete_items = {'buffers'}}
    },
    string = {{complete_items = {'path'}, triggered_only = {'/'}}},
    comment = {}
}

function nlua_attach(client)
    require('completion').on_attach({
        sorting = 'alphabet',
        matching_stategy_list = {'exact', 'fuzzy'},
        chain_complete_list = chain_complete_list
    })
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

require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = nlua_attach,

    -- Include globals you want to tell the LSP are real :)
    globals = {
        -- Colorbuddy
        "Color", "c", "Group", "g", "s"
    },
})

