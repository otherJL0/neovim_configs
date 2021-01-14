local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local completion = require'completion'

local _sumneko_lua = require'configs.lsp.sumneko'
local _jdtls = require'configs.lsp.java'
local _groovyls = require'configs.lsp.groovy'
local _pyright = require'configs.lsp.pyright'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '~',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
)

lspconfig.jdtls.setup{
  on_attach = completion.on_attach,
  cmd = _jdtls.cmd(),
  filetypes = _jdtls.filetypes()
}

lspconfig.groovyls.setup{
  on_attach = completion.on_attach,
  cmd = _groovyls.cmd()
}

lspconfig.pyright.setup{
  on_attach = completion.on_attach,
  root_dir = _pyright.root_dir(),
  settings = _pyright.settings()
}

lspconfig.sumneko_lua.setup{
  on_attach = _sumneko_lua.on_attach(),
  cmd = _sumneko_lua.cmd(),
  settints = _sumneko_lua.settings()
}
