local nnoremap = vim.keymap.nnoremap
local nvim_command = vim.api.nvim_command
local lspconfig = require('lspconfig')

vim.lsp.handlers['textDocument/formatting'] =
    function(err, _, result, _, bufnr)
      if err ~= nil or result == nil then
        return
      end
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
local function on_attach(client)
  vim.lsp.set_log_level(0)
  vim.api.nvim_set_current_dir(client.config.root_dir)
  -- cscope settings
  if vim.fn.has('cscope') == 1 then
    vim.opt.csto = 0
    vim.opt.cscopequickfix = { 's+', 'g+', 'd+', 'c+', 't+', 'e+', 'f+', 'i+', 'a+' }
    vim.opt.cscopetag = true
    vim.opt.cscoperelative = true
    vim.opt.cst = true

    if vim.fn.filereadable('cscope.out') == 1 then
      vim.cmd [[silent cs add cscope.out]]
    end
  end

  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('lsp-status').on_attach(client)

  -- nnoremap { 'K', vim.lsp.buf.hover }
  nnoremap { 'K', vim.lsp.buf.signature_help }
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
  nnoremap {
    ' wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
  }
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

local lsp_servers = {
  'pyright',
  'gopls',
  'bashls',
  'vimls',
  'dockerls',
  'jsonls',
  'tsserver',
  'clangd',
  'sorbet',
  'dartls',
}
for _, lsp in ipairs(lsp_servers) do
  local lsp_settings = load_config(lsp)
  lspconfig[lsp].setup { lsp_settings }
  lspconfig[lsp].setup { on_attach = on_attach }
end

-- Custom LSP setups
local sumneko_root_path = vim.fn.stdpath('cache') .. '/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. jit.os .. '/lua-language-server'
lspconfig.sumneko_lua.setup(require('lua-dev').setup({
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
}))

require('config.lsp.efm')

-- JDTSL config
vim.cmd [[augroup jdtls]]
vim.cmd [[au!]]
vim.cmd [[au FileType java lua require('jdtls').start_or_attach({cmd = {vim.fn.stdpath('config') .. '/scripts/jdtls.sh'}})]]
vim.cmd [[augroup end]]

-- LSP
vim.cmd([[augroup metals]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
vim.cmd(
    [[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
vim.cmd([[augroup end]])

-- Need for symbol highlights to work correctly
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])
----------------------------------
-- LSP Setup ---------------------
----------------------------------
metals_config = require('metals').bare_config

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  superMethodLensesEnabled = true,
}

-- Example of how to ovewrite a handler
metals_config.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp
                                                                             .diagnostic
                                                                             .on_publish_diagnostics,
                                                                         {
  virtual_text = { prefix = '' },
})

-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
metals_config.init_options.statusBarProvider = 'on'
metals_config.on_attach = on_attach

vim.cmd [[set path+=src/**]]

local flutter_tools = require('flutter-tools')

-- alternatively you can override the default configs
-- flutter_tools.setup {
--   ui = {
--     -- the border type to use for all floating windows, the same options/formats
--     -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
--     border = 'rounded',
--   },
--   debugger = { -- integrate with nvim dap + install dart code debugger
--     enabled = true,
--   },
--   flutter_path = '/snap/bin/flutter', -- <-- this takes priority over the lookup
--   flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
--   widget_guides = { enabled = true },
--   closing_tags = {
--     highlight = 'ErrorMsg', -- highlight for the closing tag
--     prefix = '>', -- character to use for close tag e.g. > Widget
--     enabled = true, -- set to false to disable
--   },
--   dev_log = {
--     open_cmd = 'tabedit', -- command to use to open the log buffer
--   },
--   dev_tools = {
--     autostart = true, -- autostart devtools server if not detected
--     auto_open_browser = true, -- Automatically opens devtools in the browser
--   },
--   outline = {
--     open_cmd = '30vnew', -- command to use to open the outline buffer
--   },
--   lsp = {
--     cmd = {
--       'dart',
--       vim.env.DART_HOME .. '/snapshots/analysis_server.dart.snapshot',
--       '--lsp',
--     },
--     on_attach = on_attach,
--     -- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
--     --- OR you can specify a function to deactivate or change or control how the config is created
--     settings = {
--       showTodos = true,
--       completeFunctionCalls = true,
--       -- analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
--     },
--     root_dir = require('lspconfig.util').root_pattern('pubspec.yaml'),
--   },
-- }

