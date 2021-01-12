let g:chadtree_colours = {
      \ "8_bit": {
      \ "Black": {"hl24": "#565575", "hl8":  "Black"},
      \ "BrightBlack": {"hl24": "#100e23", "hl8":  "Grey"},
      \ "Red": {"hl24": "#ff8080", "hl8":  "DarkRed"},
      \ "BrightRed": {"hl24": "#ff5458", "hl8":  "LightRed"},
      \ "Green": {"hl24": "#95ffa4", "hl8":  "DarkGreen"},
      \ "BrightGreen": {"hl24": "#62d196", "hl8":  "LightGreen"},
      \ "Yellow": {"hl24": "#ffe9aa", "hl8":  "DarkYellow"},
      \ "BrightYellow": {"hl24": "#ffb378", "hl8":  "LightYellow"},
      \ "Blue": {"hl24": "#91ddff", "hl8":  "DarkBlue"},
      \ "BrightBlue": {"hl24": "#65b2ff", "hl8":  "LightBlue"},
      \ "Magenta": {"hl24": "#c991e1", "hl8":  "DarkMagenta"},
      \ "BrightMagenta": {"hl24": "#906cff", "hl8":  "LightMagenta"},
      \ "Cyan": {"hl24": "#aaffe4", "hl8":  "DarkCyan"},
      \ "BrightCyan": {"hl24": "#63f2f1", "hl8":  "LightCyan"},
      \ "White": {"hl24": "#cbe3e7", "hl8":  "Grey"},
      \ "BrightWhite": {"hl24": "#a6b3cc", "hl8":  "LightWhite"}
      \}}

"let g:chadtree_settings = { "use_icons": false }
"
lua vim.api.nvim_set_var("chadtree_ignores", { name = {".*", ".git"} })
lua vim.api.nvim_set_var("chadtree_settings", { use_icons = false })
