local lspconfig = require("lspconfig")
local global_attach = require("configs.lsp.global_attach")
local python = require("efm/python")
local lua = require("efm/lua")

lspconfig.efm.setup {
    on_attach = global_attach.on_attach,
    init_options = {documentFormatting = true},
    settings = {rootMarkers = {".git/"}, languages = {lua = {lua.luaformat}, python = {python.black, python.isort, python.flake8, python.mypy}}}
}
