local npairs = require('nvim-autopairs')

require('nvim-ts-autotag').setup()
require('nvim-treesitter.configs').setup({ autopairs = { enable = true } })
npairs.setup({ check_ts = true, ts_config = {}, fast_wrap = {} })

npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

require('nvim-ts-autotag').setup()
require('nvim-treesitter.configs').setup({ autopairs = { enable = true } })
require('nvim-autopairs.completion.compe').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-n>')
  elseif require('luasnip').expand_or_jumpable() then
    return t("<cmd>lua require'luasnip'.jump(1)<Cr>")
  elseif check_back_space() then
    return t('<Tab>')
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-p>')
  elseif require('luasnip').jumpable(-1) then
    return t("<cmd>lua require'luasnip'.jump(-1)<CR>")
  else
    return t('<S-Tab>')
  end
end
