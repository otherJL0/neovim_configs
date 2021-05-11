local saga = require('lspsaga')
local nnoremap = vim.keymap.nnoremap

saga.init_lsp_saga()

nnoremap {"gh", require('lspsaga.provider').lsp_finder}
nnoremap {" ca", require('lspsaga.codeaction').code_action}
nnoremap {"K", require("lspsaga.hover").render_hover_doc}
nnoremap {"gs", require('lspsaga.signaturehelp').signature_help}
nnoremap {"gr", require('lspsaga.rename').rename}
nnoremap {"gd", require'lspsaga.provider'.preview_definition}

nnoremap {"<A-d>", require('lspsaga.floaterm').open_float_terminal}
