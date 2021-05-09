local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local nnoremap = vim.keymap.nnoremap
-- local finders = require('config.telescope.finders')
-- in lua/finders.lua
local finders = {}
local themes = require('telescope.themes')

-- Dropdown list theme using a builtin theme definitions :
local center_list = themes.get_dropdown({
  winblend = 10,
  width = 0.5,
  prompt = " ",
  results_height = 15,
  previewer = false,
})

-- Settings for with preview option
local with_preview = {
  winblend = 10,
  show_line = false,
  results_title = false,
  preview_title = false,
  layout_config = {
    preview_width = 0.5,
  },
}

-- Find in neovim config with center theme
finders.registers = function()
  local opts = vim.deepcopy(center_list)

  require'telescope.builtin'.registers(opts)
end

-- Find files with_preview settings
local fd = function ()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_prefix = 'FD>'
  require'telescope.builtin'.fd(opts)
end


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
