-- TokyoNight Theme
-- 	The theme comes in three styles, storm, a darker variant night and day.
vim.g.tokyonight_style = 'night'

-- 	Configure the colors used when opening a :terminal in Neovim
vim.g.tokyonight_terminal_colors = true

-- 	Make comments italic
vim.g.tokyonight_italic_comments = true

-- 	Make keywords italic
vim.g.tokyonight_italic_keywords = true

-- 	Make functions italic
vim.g.tokyonight_italic_functions = false

-- 	Make variables and identifiers italic
vim.g.tokyonight_italic_variables = false

-- 	Enable this to disable setting the background color
vim.g.tokyonight_transparent = false

-- 	Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.
vim.g.tokyonight_hide_inactive_statusline = true

-- Set a darker background on sidebar-like windows. For example: ["qf", "vista_kind", "terminal", "packer"]
vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer', 'trouble' }
-- 	Sidebar like windows like NvimTree get a darker background
vim.g.tokyonight_dark_sidebar = true

-- 	Float windows like the lsp diagnostics windows get a darker background.
vim.g.tokyonight_dark_float = true
vim.cmd([[colorscheme tokyonight]])

-- 	You can override specific color groups to use other groups or a hex color
-- vim.g.tokyonight_colors = {}
