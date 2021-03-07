RELOAD = require('plenary.reload').reload_module

RELOAD('el')
require('el').reset_windows()
local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')
local helper = require('el.helper')
local _lsp = require('lsp-status')
local ws_errors = require('lsp_extensions.workspace.diagnostic').get_count(0, 'Error')
local ws_hints = require('lsp_extensions.workspace.diagnostic').get_count(0, 'Hint')


local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
  local icon = extensions.file_icon(_, bufnr)
  if icon then
    return icon .. ' '
  end
    return ''
end)

local git_branch = subscribe.buf_autocmd(
  "el_git_branch",
  "BufEnter",
  function(window, buffer)
        local branch = extensions.git_branch(window, buffer)
        if branch then

          return ' ' .. '' .. ' ' .. branch
        end
      end
)

local git_changes = subscribe.buf_autocmd(
  "el_git_changes",
  "BufWritePost",
  function(window, buffer)
      return extensions.git_changes(window, buffer)
      end
)

require('el').setup {
  generator = function(_, _)
    return {
      extensions.gen_mode {
        format_string = ' %s '
      },
      git_branch,
      git_changes,

      ---
      sections.split,
      ---

      sections.maximum_width(
        builtin.responsive_file(140, 90),
        0.30
      ),
      sections.collapse_builtin {
        ' ',
        builtin.modified_flag
      },
      sections.split,
      -- helper.buf_var('vista_nearest_method_or_function'),
      -- lsp_statuslina.current_function,
      -- lsp_statusline.server_progress,
      -- lsp_statusline.
      '[', 'line:',builtin.line_with_width(3),']',
      '[', 'col:',  builtin.column_with_width(3), ']',
      sections.collapse_builtin {
        '[',
        builtin.help_list,
        builtin.readonly_list,
        ']',
      },
      builtin.filetype,
      lsp_statusline.segment,
    }
  end
}
