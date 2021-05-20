require('config.lsp.nlua')
require('config.lsp.efm')

local nnoremap = vim.keymap.nnoremap
local nvim_command = vim.api.nvim_command

vim.lsp.handlers['textDocument/formatting'] =
    function(err, _, result, _, bufnr)
      if err ~= nil or result == nil then return end
      if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
          nvim_command('noautocmd :update')
        end
      end
    end

local lsp_servers = { 'pyright', 'gopls' }
local lspconfig = require('lspconfig')

local list_workspace_folders = function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
local on_attach = function(client)

  require('completion').on_attach(client)
  require('lsp-status').on_attach(client)

  nnoremap { 'K', vim.lsp.buf.hover }
  nnoremap { '<C-K>', vim.lsp.buf.signature_help }
  nnoremap { ' ca', vim.lsp.buf.code_action }
  nnoremap { 'gr', vim.lsp.buf.references }
  nnoremap { 'gD', vim.lsp.buf.declaration }
  nnoremap { 'gd', vim.lsp.buf.definition }
  nnoremap { '[d', vim.lsp.diagnostic.goto_prev }
  nnoremap { ']d', vim.lsp.diagnostic.goto_next }
  nnoremap { ' D', vim.lsp.diagnostic.set_loclist }
  nnoremap { 'gi', vim.lsp.buf.implementation }
  nnoremap { ' wa', vim.lsp.buf.add_workspace_folder }
  nnoremap { ' wr', vim.lsp.buf.remove_workspace_folder }
  nnoremap { ' wl', list_workspace_folders }
  nnoremap { ' K', vim.lsp.buf.type_definition }
  nnoremap { ' e', vim.lsp.diagnostic.show_line_diagnostics }
  nnoremap { ' R', vim.lsp.buf.rename }

  if client.resolved_capabilities.document_highlight then
    nvim_command [[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]]
    nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
  end

  if client.resolved_capabilities.document_formatting then
    nnoremap { ' F', vim.lsp.buf.formatting }
    nvim_command [[augroup Format]]
    nvim_command [[autocmd! * <buffer>]]
    nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    nvim_command [[augroup END]]
  end
end

local load_config = function(lsp_server)
  local lsp_config = 'config.lsp.' .. lsp_server
  local configs = require(lsp_config)
  return configs
end

for _, lsp in ipairs(lsp_servers) do
  local lsp_settings = load_config(lsp)
  lspconfig[lsp].setup { lsp_settings }
  lspconfig[lsp].setup { on_attach = on_attach }
end

