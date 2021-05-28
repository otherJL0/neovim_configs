local snippets = require('snippets')

snippets.use_suggested_mappings()
local snippet_languages = { 'lua', 'go', 'python' }

local _snip = {}
for _, lang in ipairs(snippet_languages) do
  local snippet_lang_config = 'config.snippets.' .. lang
  _snip[lang] = require(snippet_lang_config)
end
