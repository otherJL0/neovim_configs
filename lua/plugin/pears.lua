local pears = require('pears')
local R = require('pears.rule')

pears.setup(
    function(conf)
      conf.pair(
          'then', {
            close = 'end',
            filetypes = { 'lua' },
            expand_when = R.virtual_key(R.VirtualKey.ENTER),
            should_expand = R.opener_child_of_node('if_statement'),
          }
      )

      conf.pair(
          'do', {
            close = 'end',
            filetypes = { 'lua' },
            expand_when = R.virtual_key(R.VirtualKey.ENTER),
            should_expand = R.any_of(
                R.opener_child_of_node('do_statement'),
                R.opener_child_of_node('for_in_statement'),
                R.opener_child_of_node('while_statement')
            ),
          }
      )
    end
)
