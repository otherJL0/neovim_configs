return {
  -- cmd = {"gopls", "serve"},
  cmd = { 'gopls', '--remote=auto' },
  filetypes = { 'go', 'gomod' },
  root_dir = require('lspconfig.util').root_pattern('go.mod', '.git'),
  capabilities = {
    textDocument = { completion = { completionItem = { snippetSupport = true } } },
  },
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = true,
        generate = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
        test = true,
      },
      semanticTokens = true,
      usePlaceholders = true,
      matcher = 'CaseSensitive',
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        fieldalignment = true,
        nilness = true,
        shadow = true,
      },

      staticcheck = true,
      annotations = { bounds = true, escape = true, inline = true },
      hoverKind = 'FullDocumentation',
      linkTarget = 'pkg.go.dev',
      linksInHover = true,
      importShortcut = 'Both',
      symbolMatcher = 'CaseSensitive',
      symbolStyle = 'Dynamic',
    },
  },
}
