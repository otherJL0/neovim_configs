local nnoremap = vim.keymap.nnoremap
local ts_utils = require('nvim-treesitter.ts_utils')
local uv = vim.loop

local function get_json_full_path()
  local cur_node = ts_utils.get_node_at_cursor()
  local prev_node = ts_utils.get_node_at_cursor()

  local full_path = ts_utils.get_node_text(cur_node)[1]:gsub('"', '')
  local start_pos, _, _ = cur_node:start()
  while start_pos ~= 0 do
    if cur_node:type() == 'pair' then
      local child_node = cur_node:child(0)
      local key = ts_utils.get_node_text(child_node)[1]:gsub('"', '')
      if prev_node:type() == 'object' then
        full_path = string.format('%s.%s', key, full_path)
      elseif prev_node:type() == 'array' then
        full_path = string.format('%s%s', key, full_path)
      end
    elseif cur_node:type() == 'array' then
      local count = 0
      for node in cur_node:iter_children() do
        if node:type() == 'object' then
          if node:id() == prev_node:id() then
            break
          end
          count = count + 1
        end
      end
      full_path = string.format('[%d].%s', count, full_path)
    end
    prev_node = cur_node
    cur_node = cur_node:parent()
    start_pos, _, _ = cur_node:start()
  end

  vim.notify(vim.inspect(full_path))
end

nnoremap { '  k', get_json_full_path }
