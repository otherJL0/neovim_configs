local nlua_attach = function(client)
  -- require('completion').on_attach({
  -- sorting = 'alphabet',
  -- matching_stategy_list = {'exact', 'fuzzy'},
  -- chain_complete_list = chain_complete_list
  -- })
  require('completion').on_attach(client)
  require('lsp-status').on_attach(client)

  -- Set autocommands conditional on server_capabilities
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

local sumneko_root_path = vim.fn.stdpath('cache') .. '/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. jit.os .. '/lua-language-server'

local luadev = require('lua-dev').setup(
                   {
      library = {
        vimruntime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
      },
      -- pass any additional options that will be merged in the final lsp config
      lspconfig = {
        cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
        on_attach = nlua_attach,
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

require('lspconfig').sumneko_lua.setup(luadev)
