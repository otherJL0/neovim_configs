local chain_complete_list = {
    default = {{complete_items = {'vim-dadbod-completion', 'lsp'}}}
}

local sql_attach = function(client)
    client.resolved_capabilities.execute_command = true
    require('completion').on_attach({chain_complete_list = chain_complete_list})
    require('lsp-status').on_attach(client)
    require('sqls').setup {picker = 'telescope'}
end

require('lspconfig').sqls.setup {
    cmd = {"sqls"},
    on_attach = sql_attach,
    filetypes = {"sql", "mysql", "psql", "db"}
}
