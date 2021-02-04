local _python = {}
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

-- LSP settings
function _python.lsp_root_dir()
  return util.root_pattern(
    ".git/",
    "setup.py",
    "setup.cfg",
    "tox.ini",
    "pyproject.toml",
    "requirements.txt"
  )
end

function _python.lsp_settings()
  return {
      python = {
        analysis = {
          autoImportCompletions = true;
          autoSearchPaths = true;
          diagnosticMode ="workspace";
          logLevel = "Trace";
          typeCheckingMode = "strict";
          useLibraryCodeForTypes = true;
        };
      };
    }
end

-- Formatting tools
function _python.black()
  return {
    formatCommand = "black -",
    formatStdin = true
  }
end

function _python.isort()
  return {
    formatCommand = "isort --stdout --profile black -",
    formatStdin = true
  }
end

function _python.flake8()
  return {
    lintCommand = "flake8 --max-line-length 160 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f=%l:%c: %m"}
  }
end

function _python.mypy()
  return {
    lintCommand = "mypy --show-column-numbers --ignore-missing-imports",
    lintFormats = {"%f=%l:%c: %trror: %m", "%f=%l:%c: %tarning: %m", "%f=%l:%c: %tote: %m"}
  }
end

return _python
