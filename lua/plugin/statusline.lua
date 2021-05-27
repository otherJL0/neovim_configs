vim.cmd [[packadd express_line.nvim]]
local ts_utils = require('nvim-treesitter.ts_utils')

-- TODO: Need to add those sweet sweet lsp workspace diagnostic counts

RELOAD('el')
require('el').reset_windows()

local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')
local ts_locals = require('nvim-treesitter.locals')
local ts = require('vim.treesitter')

local git_branch = subscribe.buf_autocmd(
                       'el_git_branch', 'BufEnter', function(window, buffer)
      local branch = extensions.git_branch(window, buffer)
      if branch then return ' ' .. extensions.git_icon() .. ' ' .. branch end
    end
                   )

local git_changes = subscribe.buf_autocmd(
                        'el_git_changes', 'BufWritePost', function(window, buffer)
      return extensions.git_changes(window, buffer)
    end
                    )

_G.change_count = 0
local changed_tree = function() _G.change_count = _G.change_count + 1 end

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

      ------------
      -- Middle --
      ------------
      sections.split,
      sections.maximum_width(builtin.responsive_file(140, 90), 0.30),
      sections.collapse_builtin { ' ', builtin.modified_flag },

      -----------
      -- Right --
      -----------
      sections.split,
      '[',
      builtin.line_with_width(3),
      ':',
      builtin.column_with_width(1),
      ']',
      sections.collapse_builtin { '[', builtin.help_list, builtin.readonly_list, ']' },
      builtin.filetype,
      -- '[ParentNode:',
      -- function() return ts_utils.get_node_at_cursor():parent():type() end,
      -- '][PrevTT:',
      -- function()
      --   return
      --       ts_utils.get_previous_node(ts_utils.get_node_at_cursor(), true, true):type()
      -- end,
      -- '][PrevTF:',
      -- function()
      --   return
      --       ts_utils.get_previous_node(ts_utils.get_node_at_cursor(), true, false):type()
      -- end,
      -- '][PrevFT:',
      -- function()
      --   return
      --       ts_utils.get_previous_node(ts_utils.get_node_at_cursor(), false, true):type()
      -- end,
      -- '][PrevFF:',
      -- function()
      --   return
      --       ts_utils.get_previous_node(ts_utils.get_node_at_cursor(), false, false):type()
      -- end,
      '[PrevNode]',
      function()
        return ts_locals.previous_scope(ts_utils.get_node_at_cursor()):type()
      end,
      ']',
      '][CurrentNode:',
      function() return ts_utils.get_node_at_cursor():type() end,
      '][NextNode]',
      function() return ts_locals.next_scope(ts_utils.get_node_at_cursor()):type() end,
      '] ',
      'G Count',
      function() return _G.change_count end,
      lsp_statusline.segment,
    }
  end,
}
