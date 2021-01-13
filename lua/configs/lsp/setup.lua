local _java = require'configs.lsp.java'
local _groovy = require'configs.lsp.groovy'
local lspconfig = require'lspconfig'


lspconfig.jdtls.setup{ 
  cmd = _java.setup(),
  filetypes = _java.filetypes()
}

lspconfig.groovyls.setup{ cmd = _groovy.cmd() }
