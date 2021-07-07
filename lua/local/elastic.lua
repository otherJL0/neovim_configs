--[[M = {}

M.get_elastic_url = function(unique_id)
  local head = 'vpc-shareds-domain'
  local region = 'us-east-1'
  local domain = 'amazonaws.com'
  return string.format('https://%s-%s.%s.es.%s', head, unique_id, region, domain)
end
M.url = M.get_elastic_url('bfi77qlkj3yg-zophlgtqjsqherqrs7pvqvzxtu')
M.index = 'pge-dev-icportal-*'
M.endpoint = '_search'
M.query = '"term": {"user": "com.qadoenergy.icqueue.persistence.model.User@36de731c"}'

M.get_url = function()
  local url = M.url
  local index = M.index
  local endpoint = M.endpoint
  if index then
    url = string.format('%s/%s', url, index)
  end
  return string.format('%s/%s', url, endpoint)
end

M.get_query = function()
  return string.format('{ "query": { %s } }', M.query)
end

local elastic_url = function()
  if M.index then
    M.url = string.format('%s/%s', M.url, M.index)
  end
  return string.format('%s/%s', M.url, M.endpoint)
end

local elastic_query = function()
  return string.format('{ "query": { %s } }', vim.g.M.query)
end

local flags = {
  ['-XGET'] = elastic_url(),
  ['-H'] = 'Content-Type: application/json',
  ['-d'] = elastic_query(),
}

local command = {}
for flag, value in pairs(flags) do
  vim.list_extend(command, { flag, value })
end

return M
]] vim.notify('this is fine')
