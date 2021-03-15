-- show virtual text for current frame (recommended)
vim.g.dap_virtual_text = true
-- request variable values for all frames (experimental)
-- vim.g.dap_virtual_text = 'all frames'


local dap = require('dap')
local nnoremap = vim.keymap.nnoremap

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

--[[ dap.adapters.python = {
  type = 'executable';
  command = '/home/jlopez/.miniconda3/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = '/home/jlopez/.miniconda3/bin/python'
  },
} ]]


dap.configurations.scala = {
  {
     type = 'scala',
     request = 'launch',
     name = 'Run',
     metalsRunType = 'run'
  },
  {
     type = 'scala',
     request = 'launch',
     name = 'Test File',
     metalsRunType = 'testFile'
  },
  {
     type = 'scala',
     request = 'launch',
     name = 'Test Target',
     metalsRunType = 'testTarget'
  }
}

  nnoremap { '<leader>b', dap.toggle_breakpoint}
  nnoremap { '<leader>c', dap.continue}
  nnoremap { '<leader>dr', dap.repl.open}
  -- nnoremap { '<silent> <F5> ', dap.continue()}
  -- nnoremap { '<silent> <F10> ', dap.step_over()}
  -- nnoremap { '<silent> <F11> ', dap.step_into()}
  -- nnoremap { '<silent> <F12> ', dap.step_out()}
  -- nnoremap { '<leader>B', dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))}
  -- nnoremap { '<leader>lp', dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))}
  -- nnoremap { '<leader>dl', dap.repl.run_last()}
