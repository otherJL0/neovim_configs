-- Using astronauta.nvim keymap DSL

local nnoremap = vim.keymap.nnoremap
local hop = require('hop')

nnoremap {'<leader>hello', function() print ("Hello from lua") end }
nnoremap {'<A-/>', hop.hint_char2 }
