local npairs = require('nvim-autopairs')
local ts_conds = require('nvim-autopairs.ts-conds')
local inoremap = vim.keymap.inoremap

require('nvim-ts-autotag').setup()
require('nvim-treesitter.configs').setup { autopairs = { enable = true } }
npairs.setup({ check_ts = true, ts_config = {}, fast_wrap = {} })

npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

require('nvim-ts-autotag').setup()
require('nvim-treesitter.configs').setup { autopairs = { enable = true } }
require('nvim-autopairs.completion.compe').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
})
