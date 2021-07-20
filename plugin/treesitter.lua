local ts_textobjects = require('config/treesitter/textobject')
local ts_playground = require('config/treesitter/playground')
local ts_refactor = require('config/treesitter/refactor')

-- Treesitter config
require('nvim-treesitter.configs').setup {
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
