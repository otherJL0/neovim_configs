local saga = require('lspsaga')

saga.init_lsp_saga{
  use_saga_diagnostic_sign = true,
  error_sign = 'E',
  warn_sign = 'W',
  hint_sign = 'H',
  infor_sign = 'I',
  error_header = "Error",
  warn_header = "Warn",
  hint_header = "Hint",
  infor_header = "Infor",
  max_diag_msg_width = 50,
  code_action_icon = '* ',
  code_action_keys = { quit = 'q',exec = '<CR>' },
  finder_definition_icon = 'fd',
  finder_reference_icon = 'fr',
  max_finder_preview_lines = 10,
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    scroll_down = '<C-n>',
    scroll_up = '<C-p>'
  },
  definition_preview_icon = 'Pre',
  -- -- 1: thin border | 2: rounded border | 3: thick border
  border_style = 1,
  rename_prompt_prefix = '➤',
}
