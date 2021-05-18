local nnoremap = vim.keymap.nnoremap
local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'OSX'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local cache_dir = vim.fn.stdpath('cache')
local sumneko_root_path = cache_dir .. '/nvim/nlua/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name ..
                           '/lua-language-server'

local lua_attach = function(client)
  require('completion').on_attach(client)
  require('lsp-status').on_attach(client)
  require('lsp_signature').on_attach(client)
  nnoremap { '<C-K>', vim.lsp.buf.hover }
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
        [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false
    )
  end
end

require('lspconfig').sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },

  on_attach = lua_attach,
  -- filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        -- Path setup
        path = vim.split(package.path, ';'),
      },

      completion = {
        -- You should use real snippets
        keywordSnippet = 'Disable',
      },

      diagnostics = { enable = true, disable = { 'trailing-space' }, globals = {} },

      workspace = {},
    },
  },
}
