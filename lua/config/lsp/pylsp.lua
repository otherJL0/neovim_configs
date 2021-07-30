local util = require('lspconfig.util')

return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_dir = function(fname)
    local root_files = {
      'pyproject.toml',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      'Pipfile',
    }
    return util.root_pattern(unpack(root_files))(fname)
      or util.find_git_ancestor(fname)
      or util.path.dirname(fname)
  end,
}
