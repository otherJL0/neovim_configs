local _java = {}
local U = require'snippets.utils'

local _main = U.match_indentation [[
public static void main(String args[]) {
  ${0}
}
]]

local _print = [[
System.out.println(${0});
]]

function _java.snippets()
  return {
    main = _main,
    print = _print
  }
end

return _java
