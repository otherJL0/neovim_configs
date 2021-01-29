" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
  local package_path_str = "/home/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

_G.packer_plugins = {
  ["asyncrun.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim"
  },
  chadtree = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["completion-nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["csv.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbuddy.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim"
  },
  indentLine = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  mkdx = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/mkdx"
  },
  ["modus-theme-vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-deus"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-deus"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-metals"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-tree-docs"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-tree-docs"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  onebuddy = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/onebuddy"
  },
  ["open-browser.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plantuml-previewer.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/plantuml-syntax"
  },
  playground = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["snippets.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  sonokai = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  spacebuddy = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/spacebuddy"
  },
  ["targets.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["train.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/train.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-endwise"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-floaterm"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-lsp-settings"] = {
    commands = { "LspServerInstall" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/opt/vim-lsp-settings"
  },
  ["vim-mundo"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-obsession"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-sandwich"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signature"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-signify"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-surround"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimwiki = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file LspServerInstall call s:load(['vim-lsp-settings'], { "cmd": "LspServerInstall", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
