require('el').reset_windows()
local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')
local helper = require('el.helper')


local generator = function()
    return {

      extensions.gen_mode {
        format_string = ' %s '
      },

    ' ',
    
    subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        return extensions.git_branch(window, buffer)
      end
    ),
    ' ',

    helper.async_buf_setter(
      win_id,
      'el_git_stat',
      extensions.git_changes,
      5000
    ),

     sections.split,

   builtin.filetype,
      sections.collapse_builtin {
        ' ',
        builtin.modified_flag
      },

   lsp_statusline.current_function,
    lsp_statusline.server_progress,

  '[', builtin.line_with_width(3), ':',  builtin.column_with_width(2), ']',
  sections.collapse_builtin {
    '[',
    builtin.help_list,
    builtin.readonly_list,
    ']',
      },
    }

end


require('el').setup({ generator = generator })
