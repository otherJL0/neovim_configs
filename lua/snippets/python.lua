local _python = {}
local U = require'snippets.utils'

local _main = [[
def main():
\t# TODO


if __name__ == "__main__"
\tmain()
]]

function _python.snippets()
  return {
    main = _main
  }
end

return _python
