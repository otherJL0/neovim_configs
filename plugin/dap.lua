local dap = require('dap')
local nnoremap = vim.keymap.nnoremap

nnoremap { ' B', dap.toggle_breakpoint }
nnoremap { ' C', dap.continue }
nnoremap { ' O', dap.step_over }
nnoremap { ' I', dap.step_into }
nnoremap { ' R', dap.repl.open }

dap.configurations.python = {
  {
    -- nvim-dap options
    type = 'python',
    request = 'launch',
    name = 'Launch file',

    -- debugpy options
    program = '${file}',
    pythonPath = vim.g.python3_host_prog,
  },
}

dap.adapters.python = {
  type = 'executable',
  command = vim.g.python3_host_prog,
  args = { '-m', 'debugpy.adapter' },
}
