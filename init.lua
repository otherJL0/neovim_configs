local execute = vim.api.nvim_command
local fn = vim.fn
-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
end

if vim.env.CONDA_PYTHON_EXE then
  vim.g.python3_host_prog = vim.env.CONDA_PYTHON_EXE
end

-- Globals
function P(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  function R(name)
    RELOAD(name)
    return require(name)
  end
end

-- Options
local opt = vim.opt
local nnoremap = vim.keymap.nnoremap

-- Y yank until the end of line
nnoremap { 'Y', 'y$' }

-- Make current buffer more obvious
vim.api.nvim_exec([[
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cursorcolumn
  autocmd WinEnter * set cursorline
  autocmd WinEnter * set relativenumber
  autocmd WinLeave * set nocursorcolumn
  autocmd WinLeave * set nocursorline
  autocmd WinLeave * set norelativenumber
augroup END
]], false)

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore = opt.wildignore + { '*.o', '*~', '*.pyc', '*pycache*' }

opt.wildmode = { 'longest', 'list', 'full' }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - 'list'
opt.wildmode = opt.wildmode + { 'longest', 'full' }

opt.wildoptions = 'pum'

-- opt.showmode = false
-- opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.equalalways = true -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

vim.cmd [[set undofile]]
-- Always keep sign column on
opt.signcolumn = 'yes'

vim.cmd [[set cursorcolumn]]
vim.cmd [[set cursorline]]

opt.foldmethod = 'marker'
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = 'all' -- Just turn the dang bell off

opt.clipboard = 'unnamedplus'

opt.inccommand = 'nosplit'
opt.swapfile = false -- Living on the edge
opt.shada = { '!', '\'1000', '<50', 's10', 'h' }

-- Only allow mouse in normal mode
opt.mouse = 'n'

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions - 'a' -- Auto formatting is BAD.
- 't' -- Don't auto format my code. I got linters for that.
+ 'c' -- In general, I like it when comments respect textwidth
+ 'q' -- Allow formatting comments w/ gq
- 'o' -- O and o, don't continue comments
+ 'r' -- But do continue when pressing enter.
+ 'n' -- Indent past the formatlistpat, not underneath it.
+ 'j' -- Auto-remove comments if possible.
- '2' -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = '~' }
