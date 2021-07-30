require('neorg').setup({
  -- Tell Neorg what modules to load
  load = {
    ['core.defaults'] = {}, -- Load all the default modules
    ['core.keybinds'] = { -- Configure core.keybinds
      config = {
        default_keybinds = true, -- Generate the default keybinds
        neorg_leader = '<Leader>o', -- This is the default if unspecified
      },
    },
    ['core.norg.concealer'] = {}, -- Allows for use of icons
    ['core.norg.dirman'] = { -- Manage your directories with Neorg
      config = { workspaces = { my_workspace = '~/neorg' } },
    },
  },
})

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = 'https://github.com/vhyrro/tree-sitter-norg',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}
