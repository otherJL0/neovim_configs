local trouble = require('trouble')
local nnoremap = vim.keymap.nnoremap
trouble.setup {}

nnoremap {" xx", "<cmd>Trouble<cr>"}
nnoremap {" xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>"}
nnoremap {" xd", "<cmd>Trouble lsp_document_diagnostics<cr>"}
nnoremap {" xl", "<cmd>Trouble loclist<cr>"}
nnoremap {" xq", "<cmd>Trouble quickfix<cr>"}
nnoremap {"gR", "<cmd>Trouble lsp_references<cr>"}
