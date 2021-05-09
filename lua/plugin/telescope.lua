local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local nnoremap = vim.keymap.nnoremap
local themes = require('telescope.themes')
local finders = require('config.telescope.finders')

require('telescope').setup {
  defaults = {
    prompt_position = "top",
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  }
}

nnoremap { "<C-F>", builtin.find_files }
nnoremap { "<C-Tab>", builtin.find_files }
nnoremap { "<C-G>", builtin.live_grep }
nnoremap { '""', finders.registers }
