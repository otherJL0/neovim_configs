python = {}

function python.dap_setup()
  return {
    type = 'executable',
    command = '/home/jlopez/.miniconda3/bin/python'
    args = {'-m', 'debugpy.adapter'}
  }
end

return python
