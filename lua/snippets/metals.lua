local _metals = {}
metals_config = require('metals').bare_config
metals_config.init_options.statusBarProvider = 'on'
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
}

function _metals.custom_init()
  return metals_config
end

return _metals
