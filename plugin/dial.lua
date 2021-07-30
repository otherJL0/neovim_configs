local dial = require('dial')

dial.augends['custom#Boolean'] = dial.common.enum_cyclic({
  name = 'Boolean',
  strlist = { 'True', 'False' },
})

dial.augends['custom#boolean'] = dial.common.enum_cyclic({
  name = 'boolean',
  strlist = { 'true', 'false' },
})
table.insert(dial.config.searchlist.normal, 'custom#Boolean')
table.insert(dial.config.searchlist.normal, 'custom#boolean')
