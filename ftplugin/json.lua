local nnoremap = vim.keymap.nnoremap
local ts_utils = require('nvim-treesitter.ts_utils')

local function get_json_full_path()
  local cur_node = ts_utils.get_node_at_cursor()
  local parent_node = cur_node:parent():parent()

  local full_path = {}
  local count = 0
  while true do
    count = count + 1
    local node_name = ts_utils.get_node_text(cur_node)
    if cur_node:type():find("pair") then
      local key = vim.split(node_name[1], ":")[1]
      vim.notify(vim.inspect(key))
    end
    -- vim.notify(vim.inspect(full_path))
    cur_node = cur_node:parent()
    local start_pos, _, _ = cur_node:start()
    if start_pos == 0 then
      break
    end
  end

  vim.notify(vim.inspect(full_path))
end

nnoremap { '  k', get_json_full_path }
