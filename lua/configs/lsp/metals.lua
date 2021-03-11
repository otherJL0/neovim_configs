local _metals = {}
metals_config = require('metals').bare_config
metals_config.init_options.statusBarProvider = 'on'
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
}

metals_config.on_attach = function(client, bufnr)
  require('metals').setup_dap()
end

function _metals.custom_init()
  return metals_config
end

return _metals
