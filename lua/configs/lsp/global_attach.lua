local global_attach = {}



function global_attach.on_attach(client)
    if client.resolved_capabilities.code_action then
        vim.cmd [[augroup CodeAction]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]]
        vim.cmd [[augroup END]]
    end
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
        vim.cmd [[augroup END]]
    end
    require("completion").on_attach()
end


return global_attach
