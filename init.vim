lua require('packer_init')
lua require('plugins')

lua require('lsp_signature').on_attach()
lua require('snippets').use_suggested_mappings()

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
