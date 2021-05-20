
local formatters = {}
formatters.lua = require('config.lsp.efm.lua')
formatters.python = require('config.lsp.efm.python')

require('lspconfig').efm.setup {
  init_options = { documentFormatting = true },
  on_attach = efm_attach,
  filetypes = { 'lua', 'python' },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      lua = { formatters.lua.luaformat },
      python = {
        formatters.python.black,
        formatters.python.isort,
        formatters.python.flake8,
        formatters.python.mypy,
      },
    },
  },
}
