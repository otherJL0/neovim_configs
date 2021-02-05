local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local completion = require'completion'

local _sumneko_lua = require'configs.lsp.sumneko'
local _groovyls = require'configs.lsp.groovy'
--local _pyright = require'configs.lsp.pyright'
local _global_attach = require'configs.lsp.global_attach'
local _python = require('ft/python')

lspconfig.groovyls.setup{
  on_attach = _global_attach.on_attach,
  cmd = _groovyls.cmd()
}

lspconfig.pyright.setup{
  on_attach = _global_attach.on_attach,
  root_dir = _python.lsp_root_dir(),
  settings = _python.lsp_settings(),
}

lspconfig.sumneko_lua.setup{
  on_attach = _global_attach.on_attach,
  cmd = _sumneko_lua.cmd(),
  settints = _sumneko_lua.settings()
}

lspconfig.gopls.setup{
  on_attach = _global_attach.on_attach,
}

lspconfig.kotlin_language_server.setup{
  on_attach = _global_attach.on_attach,
  cmd = {"kotlin-language-server", "--stdio"},
  root_dir = util.root_pattern("settings.gradle.kts", "settings.gradle", ".git")
}

lspconfig.gopls.setup{
  on_attach = _global_attach.on_attach,
}

lspconfig.efm.setup{
  on_attach = _global_attach.on_attach,
  init_options = {documentFormatting = true},
  filetypes = {"python"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      ["="] = {},
      python = {_python.black(), _python.isort(), _python.flake8(), _python.mypy()};
    }
  }
}
