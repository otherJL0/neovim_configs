-- curl -XGET "http://localhost:9200/pge-dev-icportal-*/_search" -H 'Content-Type: application/json' -d'{  "query": {    "term": {"user": "com.qadoenergy.icqueue.persistence.model.User@36de731c"}  }}'
local function elastic_url(unique_id)
  local region = 'us-east-1'
  local domain = 'amazonaws.com'
  return string.format('https://%s.%s.es.%s', unique_id, region, domain)
end
vim.g.elastic = {
  url = elastic_url('vpc-shareds-domain-bfi77qlkj3yg-zophlgtqjsqherqrs7pvqvzxtu'),
  index = 'pge-dev-icportal-*',
  endpoint = '_search',
  query = '"term": {"user": "com.qadoenergy.icqueue.persistence.model.User@36de731c"}',
  elastic_url = function()
    local url = vim.g.elastic.url
    local index = vim.g.elastic.index
    local endpoint = vim.g.elastic.endpoint
    if index then
      url = string.format('%s/%s', url, index)
    end
    return string.format('%s/%s', url, endpoint)
  end,
  elastic_query = function()
    return string.format('{ "query": { %s } }', vim.g.elastic.query)
  end,
}

local elastic_url = function()
  local url = vim.g.elastic.url
  local index = vim.g.elastic.index
  local endpoint = vim.g.elastic.endpoint
  if index then
    url = string.format('%s/%s', url, index)
  end
  return string.format('%s/%s', url, endpoint)
end

local elastic_query = function()
  return string.format('{ "query": { %s } }', vim.g.elastic.query)
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

