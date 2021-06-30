vim.cmd [[packadd express_line.nvim]]

-- TODO: Need to add those sweet sweet lsp workspace diagnostic counts

RELOAD('el')
require('el').reset_windows()
if vim.env.TMUX then
  local tmux_socket_path = vim.split(vim.env.TMUX, ',', true)[1]
  vim.g.tmux_socket_channel = vim.fn.sockconnect('pipe', tmux_socket_path)
end

local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')

local git_branch = subscribe.buf_autocmd('el_git_branch', 'BufEnter',
                                         function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return ' ' .. extensions.git_icon() .. ' ' .. branch
  end
end)

local git_changes = subscribe.buf_autocmd('el_git_changes', 'BufWritePost',
                                          function(window, buffer)
  return extensions.git_changes(window, buffer)
end)

-- ts.get_parser(nil, nil, { buf_attach_cbs = { on_changedtree = changed_tree } })
require('el').setup {
  generator = function(_, _)
    return {
      ----------
      -- Left --
      ----------
      extensions.gen_mode { format_string = ' %s ' },
      git_branch,
      ' ',
      git_changes,
      function()
        if vim.g.tmux_socket_channel then
          return vim.g.tmux_socket_channel
        end
      end,
      ------------
      -- Middle --
      ------------
      sections.split,
      '[Buf:',
      function()
        return vim.api.nvim_get_current_buf()
      end,
      '][Win:',
      function()
        return vim.api.nvim_get_current_win()
      end,
      '][Tab:',
      function()
        return vim.api.nvim_get_current_tabpage()
      end,
      ']',
      '[',
      function()
        return vim.fn.sockconnect('pipe', vim.env.TMUX)
      end,
      ']',
      -- sections.maximum_width(builtin.responsive_file(140, 90), 0.30),
      sections.collapse_builtin { ' ', builtin.modified_flag },

      -----------
      -- Right --
      -----------
      sections.split,
      '[',
      builtin.column_with_width(1),
      ':',
      builtin.line_with_width(3),
      ':',
      function()
        local fraction = math.floor(100 * vim.api.nvim_win_get_cursor(0)[1] /
                                        vim.api.nvim_buf_line_count(0))
        return string.format('%d%%%%', fraction)
      end,
      ']',
      sections.collapse_builtin { '[', builtin.help_list, builtin.readonly_list, ']' },
      builtin.filetype,
      lsp_statusline.segment,
    }
  end,
}
