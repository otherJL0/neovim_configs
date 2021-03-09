" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

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

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["architext.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/architext.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim"
  },
  chadtree = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["cmdbuf.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/cmdbuf.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbuddy.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/iron.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["manillua.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/manillua.nvim"
  },
  ["mirror.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/mirror.vim"
  },
  mkdx = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/mkdx"
  },
  ["modus-theme-vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  neomake = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/neomake"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-deus"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-deus"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-tree-docs"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-tree-docs"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  onebuddy = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/onebuddy"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plantuml-previewer.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  spacebuddy = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/spacebuddy"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["sqls.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/sqls.nvim"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\2M\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["train.nvim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/train.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-lsp-settings"] = {
    commands = { "LspServerInstall" },
    loaded = false,
    needs_bufread = false,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/opt/vim-lsp-settings"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  vimwiki = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/jlopez/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

-- Config for: telescope-frecency.nvim
try_loadstring("\27LJ\2\2M\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file LspServerInstall lua require("packer.load")({'vim-lsp-settings'}, { cmd = "LspServerInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
