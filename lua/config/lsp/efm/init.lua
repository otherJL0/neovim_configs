-- vim.lsp.handlers['textDocument/formatting'] =
--     function(err, _, result, _, bufnr)
--       if err ~= nil or result == nil then return end
--       if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
--         local view = vim.fn.winsaveview()
--         vim.lsp.util.apply_text_edits(result, bufnr)
--         vim.fn.winrestview(view)
--         if bufnr == vim.api.nvim_get_current_buf() then
--           vim.api.nvim_command('noautocmd :update')
--         end
--       end
--     end
local efm_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end
end

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
