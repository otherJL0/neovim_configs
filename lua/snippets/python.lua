local _python = {}
local U = require'snippets.utils'

local _main = [[
${0}


if __name__ == "__main__":
    main()
]]

local _def = [[
def ${1}(${2}):
    ${0}
]]

function _python.snippets()
  return {
    main = _main,
    def = _def
  }
end

return _python
