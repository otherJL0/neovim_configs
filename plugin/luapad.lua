require('luapad').config({
  count_limit = 150000,
  error_indicator = true,
  eval_on_move = true,
  print_highlight = 'Comment',
  error_highlight = 'WarningMsg',
  on_init = function()
    print('Hello from Luapad!')
  end,
  context = {},
})
