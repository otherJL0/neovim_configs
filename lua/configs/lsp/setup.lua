local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local completion = require'completion'

local _sumneko_lua = require'configs.lsp.sumneko'
local _jdtls = require'configs.lsp.java'
local _groovyls = require'configs.lsp.groovy'
local _pyright = require'configs.lsp.pyright'
local _global_attach = require'configs.lsp.global_attach'

lspconfig.groovyls.setup{
  on_attach = _global_attach.on_attach,
  cmd = _groovyls.cmd()
}

lspconfig.pyright.setup{
  on_attach = _global_attach.on_attach,
  root_dir = _pyright.root_dir(),
  settings = _pyright.settings()
}

lspconfig.sumneko_lua.setup{
  on_attach = _global_attach.on_attach,
  cmd = _sumneko_lua.cmd(),
  settints = _sumneko_lua.settings()
}

lspconfig.gopls.setup{
  on_attach = _global_attach.on_attach,
}
