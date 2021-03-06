lua require('packer_init')
lua require('plugins')

lua require('snippets').use_suggested_mappings()
lua require('dap-python').setup('~/.miniconda3/bin/python')

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
