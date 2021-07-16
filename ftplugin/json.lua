local nnoremap = vim.keymap.nnoremap
local ts_utils = require('nvim-treesitter.ts_utils')

local function get_json_full_path()
  local cur_node = ts_utils.get_node_at_cursor()
  local parent_node = cur_node:parent():parent()

  local full_path = ts_utils.get_node_text(cur_node)[1]:gsub('"', '')
  local start_pos, _, _ = cur_node:start()
  local prev_node = ''
  while start_pos ~= 0 do
    local node_name = ts_utils.get_node_text(cur_node)
    if cur_node:type() == 'pair' then
      local key = ts_utils.get_node_text(cur_node:child(0))[1]:gsub('"', '')
      if prev_node_type == 'object' then
        full_path = string.format('%s.%s', key, full_path)
      end
    end
    prev_node_type = cur_node:type()
    cur_node = cur_node:parent()
    start_pos, _, _ = cur_node:start()
  end

  vim.notify(vim.inspect(full_path))
end

nnoremap { '  k', get_json_full_path }
