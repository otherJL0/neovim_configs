sumneko = {}

local sumneko_root_path = "/home/jlopez/.local/share/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

function sumneko.on_attach()
  return require'completion'.on_attach
end

function sumneko.cmd()
  return {sumneko_binary, "-E", sumneko_root_path.."/main.lua"}
end

function sumneko.settings()
  return {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  }
end

function sumneko.setup()
  return {
    on_attach=sumneko.on_attach(),
    cmd=sumneko.cmd(),
    settings=sumneko.settings()
  }
end

-- -- define an chain complete list
-- require'lspconfig'.sumneko_lua.setup {
--   on_attach=require'completion'.on_attach;
--   cmd = {sumneko_binary};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = vim.split(package.path, ';'),
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     },
--   },
-- }

return sumneko
