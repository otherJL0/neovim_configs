local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
-- local finders = require('config.telescope.finders')
-- in lua/finders.lua
local finders = {}
local themes = require('telescope.themes')

-- Dropdown list theme using a builtin theme definitions :
local center_list = themes.get_dropdown(
                        {
      winblend = 10,
      width = 0.5,
      prompt = ' ',
      results_height = 15,
      previewer = false,
    }
                    )

-- Settings for with preview option
local with_preview = {
  winblend = 10,
  show_line = false,
  results_title = false,
  preview_title = false,
  layout_config = { preview_width = 0.5 },
}

-- Find in neovim config with center theme
finders.registers = function()
  local opts = vim.deepcopy(center_list)

  require'telescope.builtin'.registers(opts)
end

-- Find files with_preview settings
local fd = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_prefix = 'FD>'
  require'telescope.builtin'.fd(opts)
end

require('telescope').setup {
  defaults = {
    prompt_position = 'top',
    layout_strategy = 'horizontal',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-F>'] = actions.close,
        ['<C-G>'] = actions.close,
      },
    },
  },
}

local ivy_find_files = function()
  local opts = {
    prompt_prefix = '> ',
    mappings = { i = { ['<esc>'] = actions.close, ['<C-F>'] = actions.close } },
  }
  builtin.find_files(themes.get_ivy(opts))
end

local ivy_live_grep = function()
  local opts = {
    prompt_prefix = '> ',
    mappings = { i = { ['<esc>'] = actions.close, ['<C-G>'] = actions.close } },
  }
  builtin.live_grep(themes.get_ivy(opts))
end

local ivy_help = function()
  local opts = { prompt_prefix = '> ' }
  builtin.man_pages(themes.get_ivy(opts))
end

local ivy_lsp_implementations = function()
  builtin.lsp_implementations(themes.get_ivy({}))
end

local ivy_git_bcommits = function() builtin.git_bcommits(themes.get_ivy({})) end
local ivy_git_branches = function() builtin.git_branches(themes.get_ivy({})) end
local ivy_git_status = function() builtin.git_status(themes.get_ivy({})) end
local ivy_git_commits = function() builtin.git_commits(themes.get_ivy({})) end

-- nnoremap { '<C-F>', builtin.find_files }
nnoremap { '<C-F>', ivy_find_files }
-- nnoremap { '<C-G>', builtin.live_grep }
nnoremap { '<C-G>', ivy_live_grep }
nnoremap { '""', finders.registers }
nnoremap { '<C-H>', ivy_help }
inoremap { '<C-R>', ivy_lsp_implementations }
nnoremap { 'gI', ivy_lsp_implementations }
nnoremap { ' gbu', ivy_git_bcommits }
nnoremap { ' gbr', ivy_git_branches }
nnoremap { ' g?', ivy_git_status }
nnoremap { ' Ghis', ivy_git_commits }
