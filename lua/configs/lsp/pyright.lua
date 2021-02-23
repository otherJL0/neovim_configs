pyright = {}

local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = "pyright"
local bin_name = "pyright-langserver"

function pyright.cmd()
  return {bin_name, "--stdio"}
end

function pyright.root_dir()
  return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
end

function pyright.settings()
  return {
      python = {
        analysis = {
          autoImportCompletions = true;
          autoSearchPaths = true;
          diagnosticMode ="workspace";
          logLevel = "Trace";
          typeCheckingMode = "basic";
          useLibraryCodeForTypes = true;
        };
      };
    }
end

return pyright
