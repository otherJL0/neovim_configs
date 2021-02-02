local _python = {}

function _python.setup()
  return {
    exe = "black",
    args = "",
    stdin = true
  }
end

return _python
