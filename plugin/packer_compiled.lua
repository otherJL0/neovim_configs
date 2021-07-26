-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jlopez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["moonbase.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/moonbase.nvim"
  },
  neorg = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-jqx"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-jqx"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-tree-docs"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-tree-docs"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["sqls.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/sqls.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-tmux"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/vim-tmux"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/jlopez/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
