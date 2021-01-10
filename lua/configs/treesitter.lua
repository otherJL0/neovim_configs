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

local _playground = {
  enable = true,
  disable = {},
  updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
  persist_queries = false -- Whether the query persists across vim sessions
}

local _query_linter = {
  enable = true,
  use_virtual_text = true,
  lint_events = {"BufWrite", "CursorHold"},
}

local _refactor = {
  highlight_definitions = { enable = true },
}


-- Load all local settings
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = _hightlight,
  indent = _indent,
  incremental_selection = _incremental_selection,
  playground = _playground,
  query_linter = _query_linter,
  refactor = _refactor,
}
