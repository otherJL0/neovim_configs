-- Settings for extensions
local _textobjects = require'configs.treesitter.textobjects'
local _refactor = require'configs.treesitter.refactor'
local _tree_docs = require'configs.treesitter.tree_docs'
local _playground = require'configs.treesitter.playground'

-- Settings for built-in modules
local _highlight = {
  enable = true,
  use_language_tree = true
}

local _indent = {
  enable = true,
}

local _incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
  },
}

-- Load all local settings
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = _hightlight,
  indent = _indent,
  incremental_selection = _incremental_selection,
  playground = _playground.setup(),
  query_linter = _playground.query_linter(),
  textobjects = _textobjects.setup(),
  refactor = _refactor.setup(),
  --tree_docs = _tree_docs.setup(),
}
