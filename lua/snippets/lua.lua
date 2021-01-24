local _lua = {}
local U = require'snippets.utils'

local _req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']]
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
  }
end

return _lua
