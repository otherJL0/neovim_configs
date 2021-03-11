local test = {}

local ido = require('ido')

test.settings = {
  ls_opts = ""
}

function test.main()
  print(ido.start{
    items = vim.fn.systemlist("ls "..test.settings.ls_opts.." $HOME")
  })
end

return test

