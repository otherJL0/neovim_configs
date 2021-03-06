local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local completion = require('completion')
local global_attach = require('configs.lsp.global_attach')

lspconfig.vimls.setup{
  cmd = { "vim-language-server", "--stdio" },
  on_attach = global_attach.on_attach,
  filetypes = { "vim" },
  init_options = {
    diagnostic = {
      enable = true
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true
    },
    vimruntime = ""
  },
  root_dir = util.root_pattern(".git", "README.md", "init.vim", "init.lua"),
}
