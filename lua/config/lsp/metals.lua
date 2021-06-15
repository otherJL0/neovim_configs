local metals_config = require('metals').bare_config
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  superMethodLensesEnabled = true,
}
metals_config.init_options.statusBarProvider = 'on'
return metals_config
