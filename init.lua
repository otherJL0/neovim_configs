local execute = vim.api.nvim_command
local fn = vim.fn

-- Stolen from TJ Devries
require('config/globals')

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
else
    -- All other logic depends on Packer being present
    require('packer_plugins')
end
