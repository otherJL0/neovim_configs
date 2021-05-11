local snippets = require('snippets')
local utils = require('snippets.utils')

snippets.use_suggested_mappings(true)

local pydoc = [[
"""
${0}
"""
]]

snippets.snippets = {
  python = {
    doc = utils.match_indentation(pydoc)
  }
}

