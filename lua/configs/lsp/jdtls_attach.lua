jdtls_attach = {}

function jdtls_attach.on_attach (client)
  -- Set autocommands conditional on server_capabilities
  require'completion'.on_attach(client)
  require'lsp-status'.on_attach(client)
  require('jdtls').setup_dap()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- GOTO mappings
  buf_set_keymap('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- ACTION mappings
  buf_set_keymap('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n','<leader>af', '<cmd>lua require"jdtls".code_action()<CR>', opts)
  buf_set_keymap('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- Few language severs support these three
  buf_set_keymap('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  -- Diagnostics mapping
  buf_set_keymap('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  buf_set_keymap('n', [[<leader>ai]], [[<Cmd>lua require'jdtls'.organize_imports()<CR>]])
  buf_set_keymap('n', [[<leader>av]], [[<Cmd>lua require('jdtls').extract_variable()<CR>]])
  buf_set_keymap('v', [[<leader>av]], [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]])
  buf_set_keymap('v', [[<leader>am]], [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]])
  buf_set_keymap('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]])

  vim.cmd[[command! -buffer JdtCompile lua require('jdtls').compile()]]
  vim.cmd[[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]]
  vim.cmd[[command! -buffer JdtJol lua require('jdtls').jol()]]
  vim.cmd[[command! -buffer JdtBytecode lua require('jdtls').javap()]]
  vim.cmd[[command! -buffer JdtJshell lua require('jdtls').jshell()]]

  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
end

return jdtls_attach
