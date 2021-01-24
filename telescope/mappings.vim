nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>

nnoremap <leader>ts <cmd>Telescope treesitter<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gl <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

nnoremap <leader>ref <cmd>Telescope lsp_references<cr>
"nnoremap <leader>lca Telescope lsp_code_actions<cr>
nnoremap <Leader>ca :lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown({initial_mode='normal'}))<cr>

autocmd User TelescopePreviewerLoaded setlocal number
