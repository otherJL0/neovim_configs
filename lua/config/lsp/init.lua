local nnoremap = vim.keymap.nnoremap
local nvim_command = vim.api.nvim_command
local lspconfig = require('lspconfig')

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
  nnoremap { ' wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end }
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

local lsp_servers = { 'pyright', 'gopls', 'bashls', 'vimls', 'dockerls', 'jsonls'}
for _, lsp in ipairs(lsp_servers) do
  local lsp_settings = load_config(lsp)
  lspconfig[lsp].setup { lsp_settings }
  lspconfig[lsp].setup { on_attach = on_attach }
end



-- Custom LSP setups
local sumneko_root_path = vim.fn.stdpath('cache') .. '/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. jit.os .. '/lua-language-server'
lspconfig.sumneko_lua.setup(
require('lua-dev').setup(
{
      library = {
        vimruntime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
      },
      -- pass any additional options that will be merged in the final lsp config
      lspconfig = {
        cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ':') },

            completion = { keyworkSnippet = 'Disable' },

            diagnostics = { enable = true },

          },
        },
      },
    }
)
)

require('config.lsp.efm')
