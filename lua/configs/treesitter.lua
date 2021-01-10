-- settings per component

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
}
