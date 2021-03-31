local M = {}

local _main = [[
int main (int argc, char  *argv[])
{
  ${0}
}
]]

local _include = [[
#include <${1}>
${0}
]]

function M.snippets()
  return {
    main = _main,
    include = _include
  }
end

return M
