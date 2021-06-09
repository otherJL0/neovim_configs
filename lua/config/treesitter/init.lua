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

_G.MUtils = {}

vim.g.completion_confirm_key = ''

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      require'completion'.confirmCompletion()
      return npairs.esc('<c-y>')
    else
      vim.api.nvim_select_popupmenu_item(0, false, false, {})
      require'completion'.confirmCompletion()
      return npairs.esc('<c-n><c-y>')
    end
  else
    return npairs.autopairs_cr()
  end
end

vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()',
                        { expr = true, noremap = true })
