local _lua = {}
local U = require'snippets.utils'

local _mod = [[
local ${1} = {}
$0
return ${1}
]]


local _req = [[
local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require('$1')
$0
]]

local _func = [[
function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})
  $0
end]];

function _lua.snippets()
  return {
    req = _req;
    func = _func;
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
    -- Match the indentation of the current line for newlines.
    ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
    mod = _mod
  }
end

return _lua
