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


local _java = require'configs.lsp.java'
local _groovy = require'configs.lsp.groovy'
require'configs.lsp.sumneko'
require'configs.lsp.pyright'
local lspconfig = require'lspconfig'
local util = require 'lspconfig/util'



lspconfig.jdtls.setup{
  on_attach=require'completion'.on_attach,
  cmd = _java.cmd(),
  filetypes = _java.filetypes()
}

lspconfig.groovyls.setup{ cmd = _groovy.cmd() }

lspconfig.pyright.setup{
on_attach=require'completion'.on_attach,
root_dir = util.root_pattern(".git", "setup.py", "setup.cfg", "requirements.txt", "pyproject.toml")
}
