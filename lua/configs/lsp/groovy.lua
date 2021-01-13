groovy = {}

function groovy.cmd()
  return {
  "/usr/bin/java",
  "-jar",
  "/home/jlopez/.local/share/vim-lsp-settings/servers/groovy-language-server/build/libs/groovy-language-server-all.jar"
}
end

return groovy
