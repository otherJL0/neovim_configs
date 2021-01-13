local _java = require'configs.lsp.java'
local _groovy = require'configs.lsp.groovy'
require'configs.lsp.sumneko'
require'configs.lsp.pyright'
local lspconfig = require'lspconfig'
local util = require 'lspconfig/util'



lspconfig.jdtls.setup{
  cmd = _java.cmd(),
  filetypes = _java.filetypes()
}

lspconfig.groovyls.setup{ cmd = _groovy.cmd() }

lspconfig.pyright.setup{
root_dir = util.root_pattern(".git", "setup.py", "setup.cfg", "requirements.txt", "pyproject.toml")
}
