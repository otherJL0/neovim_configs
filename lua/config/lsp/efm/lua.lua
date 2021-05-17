local options = {
  ['column-limit'] = 88,
  ['indent-width'] = 2,
  ['use-tab'] = false,
  ['keep-simple-control-block-one-line'] = true,
  ['keep-simple-function-one-line'] = true,
  ['align-args'] = true,
  ['break-after-functioncall-lp'] = true,
  ['break-before-functioncall-rp'] = true,
  ['align-parameter'] = true,
  ['chop-down-parameter'] = true,
  ['break-after-functiondef-lp'] = true,
  ['break-before-functiondef-rp'] = true,
  ['align-table-field'] = true,
  ['break-after-table-lb'] = true,
  ['break-before-table-rb'] = true,
  ['chop-down-table'] = true,
  ['chop-down-kv-table'] = true,
  ['extra-sep-at-table-end'] = true,
  ['break-after-operator'] = true,
  ['double-quote-to-single-quote'] = true,
  -- ["single-quote-to-double-quote"] = false,
  ['spaces-inside-functiondef-parens'] = false,
  ['spaces-inside-functioncall-parens'] = false,
  ['spaces-inside-table-braces'] = true,
  ['spaces-around-equals-in-field'] = true,
  -- ['line-breaks-after-function-body'] = true,
}

local format_options = function(opts)
  local result = ''
  for opt, value in pairs(opts) do
    if value == true then
      result = result .. ' --' .. opt
    elseif value == false then
      result = result .. ' --no-' .. opt
    else
      result = result .. ' --' .. opt .. '=' .. value
    end
  end
  return result
end

local formatted_options = 'lua-format -i ' .. format_options(options)

return { luaformat = { formatCommand = formatted_options, formatStdin = true } }
