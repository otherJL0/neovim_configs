local extensions = require('el.extensions')
local subscribe = require('el.subscribe')
local generator = function(_window, buffer)
   local segments = {}

   table.insert(segments,
    subscribe.buf_autocmd(
      "el_git_status",
      "BufWritePost",
      function(window, buffer)
        return extensions.git_changes(window, buffer)
      end
    ))

   table.insert(segments,
    subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        return extensions.git_branch(window, buffer)
      end
    ))

   table.insert(segments, extensions.mode)


end
require('el').setup({generator = generator})
