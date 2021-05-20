return {
  cmd = { 'bash-language-server', 'start' },
  cmd_env = { GLOB_PATTERN = '*@(.sh|.bash)' },
  filetyes = { 'sh' },
}
