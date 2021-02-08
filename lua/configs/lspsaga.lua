local saga = require('lspsaga')
--saga.init_lsp_saga()

saga.init_lsp_saga{
  use_saga_diagnostic_sign = true,
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    scroll_down = 'j',
    scroll_up = 'k'
  },
  -- -- -- 1: thin border | 2: rounded border | 3: thick border
  border_style = 2,
}
