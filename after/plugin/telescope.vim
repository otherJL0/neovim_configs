nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}<CR>
nnoremap <Leader>t :Telescope


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>

nnoremap <leader>ts <cmd>Telescope treesitter<cr>
" nnoremap <leader>gs <cmd>Telescope git_status<cr>
" nnoremap <leader>gs :lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown({}))<cr>
" nnoremap <leader>gl <cmd>Telescope git_commits<cr>
" nnoremap <leader>gb <cmd>Telescope git_branches<cr>

nnoremap <leader>ref <cmd>Telescope lsp_references<cr>
nnoremap <leader>? <cmd> Telescope cheat fd<cr>

autocmd User TelescopePreviewerLoaded setlocal number
