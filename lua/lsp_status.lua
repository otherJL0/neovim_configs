local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require('lspconfig')

-- Some arbitrary servers
nvim_lsp.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

