local cwd = vim.api.nvim_eval('getcwd()')
local nvim_config = vim.fn.stdpath('config')
if cwd == nvim_config then
  require('config.lsp.nlua')
else
  require('config.lsp.lua')
end
require('config.lsp.pyright')
require('config.lsp.efm')
require('config.lsp.yaml')
require('config.lsp.sql')
require('config.lsp.clangd')
require('config.lsp.bash')
require('config.lsp.vimscript')
require('config.lsp.docker')
require('config.lsp.css')
require('config.lsp.vue')
require('config.lsp.gopls')
