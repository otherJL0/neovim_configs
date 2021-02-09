nnoremap <leader>gs :botright Gina status --opener=split<cr>
nnoremap <leader>gl :botright Gina log --opener=vsplit<cr>
nnoremap <leader>gc :AsyncTask git-commit<cr>
nnoremap <leader>gp :AsyncTask git-push<cr>
nnoremap <Leader>gz :lua require'telescope.builtin'.git_bcommits(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>gZ :lua require'telescope.builtin'.git_commits(require('telescope.themes').get_dropdown({}))<cr>


