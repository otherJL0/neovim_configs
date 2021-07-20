local execute = vim.api.nvim_command
local fn = vim.fn
-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Stolen from TJ Devries
require('config/globals')

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system(
      { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
else
  -- All other logic depends on Packer being present
  require('packer_plugins')

  -- Force loading of astronauta first
  vim.cmd [[runtime plugin/astronauta.vim]]

  -- Vim Options
  require('config.options')
  require('config.treesitter')

  -- Sane Completion
  require('config.completion')

  -- Snippets

  -- LSP
  require('config.lsp')

end

if vim.env.CONDA_PYTHON_EXE then
  vim.g.python3_host_prog = vim.env.CONDA_PYTHON_EXE
end
