local _python = require('configs/formatter/python')
local _go = require('configs/formatter/go')

require('formatter').setup({
  logging = false,
  filetype = {
    python = { _python.setup() },
    go = { _go.setup() }
  }
})
