local cwd = vim.api.nvim_eval("getcwd()")
local nvim_dir = ".config/nvim"
if string.find(cwd, nvim_dir) then
  require('config.lsp.nlua')
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
