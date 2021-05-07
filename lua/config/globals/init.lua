function P(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  function R(name)
    RELOAD(name)
    return require(name)
  end
end

-- adds 'vim.opt'
require('config.globals.opt')
