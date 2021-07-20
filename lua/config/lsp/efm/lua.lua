return {
  luaformat = { formatCommand = 'lua-format -i', formatStdin = true },
  luacheck = {
    lintCommand = 'luacheck src -',
    lintFormats = '%f:%l:%c: %trror: %m',
    '%f:%l:%c: %tarning: %m',
    '%f:%l:%c: %tote: %m',
    lintSource = 'luacheck',
  },
}
