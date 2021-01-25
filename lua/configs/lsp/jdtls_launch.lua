local jdtls_launch = {}

local cmd_path = 'jdtls.sh'
local jdtls_attach = require'configs/lsp/jdtls_attach'
local debug_path = "/home/jlopez/.config/lsp/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
local java_test_path = "/home/jlopez/.config/lsp/vscode-java-test/server/*.jar"
local _bundles = {vim.fn.glob(debug_path)}
vim.list_extend(_bundles, vim.split(vim.fn.glob(java_test_path), "\n"))

function jdtls_launch.setup()
  vim.cmd[[set softtabstop=4]]
  vim.cmd[[set shiftwidth=4]]
  vim.cmd[[set noexpandtab]]


  require('jdtls').start_or_attach({
    init_options = {
      bundles = _bundles
    },
    cmd={cmd_path},
    on_attach= function(client)
      jdtls_attach.on_attach(client)
    end,
    root_dir = require('jdtls.setup').find_root({
      'gradle.build',
      'pom.xml',
      '.git',
      'gradle.build.kts'
     })
   })
end

return jdtls_launch
