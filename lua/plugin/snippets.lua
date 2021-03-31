local _java = require'snippets/java'
local _lua = require'snippets/lua'
local _groovy = require'snippets/groovy'
local _python = require'snippets/python'
local _markdown = require'snippets/markdown'

local snippets = require'snippets'
local U = require'snippets.utils'

snippets.snippets = {
  lua = _lua.snippets(),
  groovy = _groovy.snippets(),
  java = _java.snippets(),
  python = _python.snippets(),
  markdown = _markdown.snippets(),
  terraform = require('snippets.terraform').snippets(),
  cpp = require('snippets.cpp').snippets(),
}
