Elastic = { cmd = { 'curl' }, indices = '' }
Elastic.__index = Elastic
Elastic.index = 'pge-dev-icportal-*'

function Elastic:test()
  vim.notify('this is a test')
end

function Elastic:set_index(index)
  self.index = index
end

function Elastic:get_index()
  if not self.index then
    return
  end
  return self.index
end

function Elastic:list_indices()
  self.indices = ''
  local endpoint = '_aliases'
  local cmd = { 'curl', string.format('%s/%s', vim.env.ELASTIC_URL, endpoint) }
  local opts = {
    on_stdout = function(chan_id, data, name)
      self.indices = string.format('%s%s', self.indices, data[1])
    end,
    on_exit = function(job_id, exit_code, event_type)
      local win_config = { relative = 'win', row = 30, col = 80, width = 90,
                           height = 30 }

      local float_buffer = vim.api.nvim_create_buf(false, false)
      local lines = vim.fn.json_decode(self.indices)
      vim.api.nvim_buf_set_lines(float_buffer, 0, 0, false, vim.tbl_keys(lines))
      local float_win = vim.api.nvim_open_win(float_buffer, false, win_config)
    end,
  }
  vim.fn.jobstart(cmd, opts)
end

function Elastic:search(query)
  self.results = ''
  self.query = query or { query = { match_all = vim.emtpy_dict() } }
  self.query = vim.fn.json_encode(self.query)

  local flags = {
    ['-XGET'] = string.format('%s/_search', vim.env.ELASTIC_URL),
    ['-H'] = [['Content-Type: application/json']],
    ['-d'] = self.query,
  }
  local cmd = 'curl'
  for flag, value in pairs(flags) do
    cmd = string.format('%s %s %s', cmd, flag, value)
    -- vim.list_extend(cmd, { flag, value })
  end

  local opts = {
    on_stdout = function(chan_id, data, name)
      self.results = string.format('%s%s', self.results, data[1])
    end,
    on_exit = function(job_id, exit_code, event_type)
      local win_config = { relative = 'win', row = 30, col = 80, width = 90,
                           height = 30 }

      local result_buffer = vim.api.nvim_create_buf(false, false)
      vim.api.nvim_buf_set_lines(result_buffer, 0, 0, false, { self.results })
      vim.api.nvim_buf_set_option(result_buffer, 'buftype', 'nofile')
      vim.api.nvim_buf_set_option(result_buffer, 'swapfile', false)
      vim.api.nvim_buf_set_option(result_buffer, 'buflisted', false)
      vim.api.nvim_buf_set_option(result_buffer, 'filetype', 'json')

      local query_buffer = vim.api.nvim_create_buf(false, false)
      vim.api.nvim_buf_set_lines(query_buffer, 0, 0, false, { self.query })
      vim.api.nvim_buf_set_option(query_buffer, 'buftype', 'nofile')
      vim.api.nvim_buf_set_option(query_buffer, 'swapfile', false)
      vim.api.nvim_buf_set_option(query_buffer, 'buflisted', false)
      vim.api.nvim_buf_set_option(query_buffer, 'filetype', 'json')

      -- vim.api.nvim_buf_call(float_buffer, vim.cmd('%! jq .'))
      -- local float_win = vim.api.nvim_open_win(float_buffer, true, win_config)
      -- vim.cmd('tabnew')
      -- vim.api.nvim_win_set_buf(0, query_buffer)
      -- vim.api.nvim_buf_call(query_buffer, vim.cmd('%! jq .'))

      vim.cmd('vsplit')
      vim.api.nvim_win_set_buf(0, result_buffer)
      vim.api.nvim_buf_call(result, vim.cmd('%! jq .'))
    end,
  }
  vim.fn.jobstart(cmd, opts)
end

return Elastic
