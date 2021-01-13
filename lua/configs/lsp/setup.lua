local lspconfig = require'lspconfig'

local java_cmd = { 
"/usr/bin/java",
 "-Declipse.application=org.eclipse.jdt.ls.core.id1",
 "-Dosgi.bundles.defaultStartLevel=4",
 "-Declipse.product=org.eclipse.jdt.ls.core.product",
 "-Dlog.protocol=true",
 "-Dlog.level=ALL",
 "-Xms1g",
 "-Xmx2G",
 "-jar",
 "/home/jlopez/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar",
 "-configuration",
 "/home/jlopez/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls/config_linux",
 "-data",
 "/home/jlopez/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls/data",
 "--add-modules=ALL-SYSTEM",
 "--add-opens java.base/java.util=ALL-UNNAMED",
 "--add-opens java.base/java.lang=ALL-UNNAMED" 
}


lspconfig.jdtls.setup{
  cmd = java_cmd,
  filetypes = {"java", "gradle", "build", "groovy"}
}

