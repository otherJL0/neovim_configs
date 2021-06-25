vim.opt.completeopt = { 'menuone', 'noselect' }

-- Don't show the dumb matching stuff.
vim.cmd [[set shortmess+=c]]
vim.cmd [[set shortmess-=F]]
vim.g.completion_confirm_key = ''
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_enable_snippet = 'snippets.nvim'
