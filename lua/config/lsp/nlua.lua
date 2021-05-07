local nnoremap = vim.keymap.nnoremap
local buf = vim.lsp.buf
local diagnostic = vim.lsp.diagnostic

local chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },
  comment = {},
}

function nlua_attach(client)
  require('completion').on_attach({
    sorting = 'alphabet',
    matching_stategy_list = {'exact', 'fuzzy'},
    chain_complete_list = chain_complete_list,
  })

  -- Mappings.
  -- nnoremap { 'gD', buf.declaration() }
  nnoremap { 'gd', buf.definition }
  nnoremap { 'K', buf.hover }
  nnoremap { 'gi', buf.implementation }
  nnoremap { '<C-k>', buf.signature_help }
  nnoremap { '<space>wa', buf.add_workspace_folder }
  nnoremap { '<space>wr', buf.remove_workspace_folder }
  nnoremap { '<space>wl', buf.list_workspace_folders }
  nnoremap { '<space>D', buf.type_definition }
  nnoremap { '<space>rn', buf.rename }
  nnoremap { '<space>ca', buf.code_action }
  nnoremap { 'gr', buf.references }
  nnoremap { '<space>e', diagnostic.show_line_diagnostics }
  nnoremap { '[d', diagnostic.goto_prev }
  nnoremap { ']d', diagnostic.goto_next }
  nnoremap { '<space>q', diagnostic.set_loclist }

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    nnoremap { "<space>f", buf.formatting }
  end
  if client.resolved_capabilities.document_range_formatting then
    nnoremap { "<space>f", buf.range_formatting }
  end

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
    "Color", "c", "Group", "g", "s",
  }
})

