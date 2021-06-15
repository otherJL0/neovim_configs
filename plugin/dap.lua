local dap = require('dap')
local dapui = require('dapui')
local nnoremap = vim.keymap.nnoremap

nnoremap { ' B', dap.toggle_breakpoint }
nnoremap { ' C', dap.continue }
nnoremap { ' O', dap.step_over }
nnoremap { ' I', dap.step_into }
nnoremap { ' R', dap.repl.open }

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch',
    name = 'Launch file',

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = '${file}', -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end,
  },
}

dap.adapters.go = function(callback, config)
  local handle
  local pid_or_err
  local port = 38697
  handle, pid_or_err = vim.loop.spawn(
                           'dlv', {
        args = { 'dap', '-l', '127.0.0.1:' .. port },
        detached = true,
      }, function(code)
        handle:close()
        print('Delve exited with exit code: ' .. code)
      end
                       )
  -- Wait 100ms for delve to start
  vim.defer_fn(
      function()
        -- dap.repl.open()
        callback({ type = 'server', host = '127.0.0.1', port = port })
      end, 100
  )

  -- callback({type = "server", host = "127.0.0.1", port = port})
end
--
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md

dap.adapters.go = {
  type = 'executable',
  command = 'dlv',
  args = {'dap', '--headless'}
}
dap.configurations.go = {
  { type = 'go', name = 'Debug', request = 'launch', program = '${file}' },
}

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to running Neovim instance',
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= '' then return value end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, 'Please provide a port number')
      return val
    end,
  },
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end

dapui.setup(
    {
      icons = { expanded = '⯆', collapsed = '⯈', circular = '↺' },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
      },
      sidebar = {
        elements = {
          -- You can change the order of elements in the sidebar
          'scopes',
          'stacks',
          'watches',
        },
        width = 40,
        position = 'left', -- Can be "left" or "right"
      },
      tray = {
        elements = { 'repl' },
        height = 10,
        position = 'bottom', -- Can be "bottom" or "top"
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
      },
    }
)
