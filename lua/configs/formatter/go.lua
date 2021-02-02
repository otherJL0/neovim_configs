local _go = {}

function _go.setup()
  return {
    exe = "gofmt",
    args = {"-w"},
    stdin = true
  }
end

return _go
