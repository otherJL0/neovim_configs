local jdtls_launch = {}

local cmd_path = 'jdtls.sh'
local jdtls_attach = require'configs/lsp/jdtls_attach'

function jdtls_launch.setup()
  vim.cmd[[set softtabstop=4]]
  vim.cmd[[set shiftwidth=4]]
  vim.cmd[[set noexpandtab]]

  require('jdtls').start_or_attach({
    cmd={cmd_path},
    on_attach=jdtls_attach.on_attach,
    root_dir = require('jdtls.setup').find_root({
      'gradle.build',
      'pom.xml',
      '.git',
      'gradle.build.kts'
     })
   })
end

return jdtls_launch
