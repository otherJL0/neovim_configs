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
  local flags = {
    ['-XGET'] = string.format('%s/%s/_search', vim.env.ELASTIC_URL, self.index),
    ['-H'] = 'Content-Type: application/json',
    ['-d'] = string.format('{ "query" : { %s } }', query),
  }
  local cmd = { 'curl' }
  for flag, value in pairs(flags) do
    vim.list_extend(cmd, { flag, value })
  end
  print(vim.inspect(cmd))
end

return Elastic
