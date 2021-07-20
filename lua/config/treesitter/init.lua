local ts_textobjects = require('config/treesitter/textobject')
local ts_playground = require('config/treesitter/playground')
local ts_refactor = require('config/treesitter/refactor')
local npairs = require('nvim-autopairs')
npairs.setup({ check_ts = true, ts_config = { go = { 'body' } } })

-- Treesitter config
require('nvim-treesitter.configs').setup {
  autopairs = { enable = true },
  autotag = { enable = true },

  ensure_installed = 'maintained',

  -- Consistent syntax highlighting
  highlight = { enable = true },

  -- Incremental selection based on named nodes from grammar
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },

  -- Tree-sitter based indentation
  indent = { indent = { enable = true } },

  -- Added by nvim-treesitter-refactor plugin
  refactor = ts_refactor,

  textobjects = ts_textobjects,

  playground = ts_playground,

}

require('nvim-autopairs.completion.compe').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t '<Plug>(vsnip-expand-or-jump)'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t '<Plug>(vsnip-jump-prev)'
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t '<S-Tab>'
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
