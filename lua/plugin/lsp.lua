local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local completion = require'completion'

local _sumneko_lua = require'configs.lsp.sumneko'
local _groovyls = require'configs.lsp.groovy'
--local _pyright = require'configs.lsp.pyright'
local _global_attach = require'configs.lsp.global_attach'
local _python = require('ft/python')

lspconfig.groovyls.setup{
  on_attach = _global_attach.on_attach,
  cmd = _groovyls.cmd()
}

lspconfig.pyright.setup{
  on_attach = _global_attach.on_attach,
  root_dir = _python.lsp_root_dir(),
  settings = _python.lsp_settings(),
}

lspconfig.sumneko_lua.setup{
  on_attach = _global_attach.on_attach,
  cmd = _sumneko_lua.cmd(),
  settints = _sumneko_lua.settings()
}

lspconfig.gopls.setup{
  on_attach = _global_attach.on_attach,
}

lspconfig.kotlin_language_server.setup{
  on_attach = _global_attach.on_attach,
  cmd = {"kotlin-language-server", "--stdio"},
  root_dir = util.root_pattern("settings.gradle.kts", "settings.gradle", ".git")
}

lspconfig.gopls.setup{
  on_attach = _global_attach.on_attach,
}

lspconfig.efm.setup{
  on_attach = _global_attach.on_attach,
  init_options = {documentFormatting = true},
  filetypes = {"python"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      ["="] = {},
      python = {_python.black(), _python.isort(), _python.flake8(), _python.mypy()};
    }
  }
}

lspconfig.cmake.setup{
  cmd = {"cmake-language-server"},
  filetypes = {"cmake"},
  init_options = {
    buildDirectory = "build"
  },
  root_dir = util.root_pattern("compile_commands.json", "build", "makefile", "README.md")
}

lspconfig.clangd.setup{
  on_attach = _global_attach.on_attach,
  cmd = {"clangd-13", "--background-index"},
  filetypes = {"c", "cpp", "cu", "h", "hpp", "c++", "h++"},
  root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", "build", "README.md", "makefile")
}


lspconfig.clojure_lsp.setup{
  on_attach = _global_attach.on_attach,
  filetypes = {"clojure", "edn"},
  root_dir = util.root_pattern("project.clj", "deps.edn", "README.md")
}

lspconfig.codeqlls.setup{
  on_attach = _global_attach.on_attach,
  filetypes = {"ql"},
  log_level = 2,
  root_dir = util.root_pattern(".git", "README.md"),
}

lspconfig.vimls.setup{
  cmd = { "vim-language-server", "--stdio" },
  on_attach = _global_attach.on_attach,
  filetypes = { "vim" },
  init_options = {
    diagnostic = {
      enable = true
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true
    },
    vimruntime = ""
  },
  root_dir = util.root_pattern(".git", "README.md", "init.vim", "init.lua"),
}

lspconfig.terraformls.setup{
  cmd = {"terraform-ls", "serve"},
  on_attach = _global_attach.on_attach,
  filetypes = {"terraform", "hcl"},
  root_dir = util.root_pattern(".terraform", ".git")
}

lspconfig.yamlls.setup{
  cmd = {"yaml-language-server", "--stdio"},
  on_attach = _global_attach.on_attach,
  filetypes = {"yaml", "yml"},
  root_dir = util.root_pattern(".git", vim.fn.getcwd())
}

lspconfig.sqls.setup{
  cmd = {"sqls"},
  on_attach = _global_attach.on_attach,
  filetypes = {"sql"},
  root_dir = util.root_pattern(".git", vim.fn.getcwd())
}

lspconfig.jsonls.setup{
  cmd = {"vscode-json-languageserver", "--stdio"},
  on_attach = _global_attach.on_attach,
  filetypes = {"json"},
  init_options = {
      provideFormatter = true
    },
  root_dir = util.root_pattern(".git", vim.fn.getcwd())
}

lspconfig.graphql.setup{
  cmd = {"graphql-lsp", "server", "-m", "stream"},
  on_attach = _global_attach.on_attach,
  filetypes = {"graphql"},
  root_dir = util.root_pattern(".git", ".graphqlrc")
}

lspconfig.dockerls.setup{
  cmd = {"docker-langserver", "--stdio"},
  on_attach = _global_attach.on_attach,
  filetypes = {"Dockerfile", "dockerfile"},
  root_dir = util.root_pattern("Dockerfile")
}

lspconfig.bashls.setup{
  cmd = { "bash-language-server", "start" },
  on_attach = _global_attach.on_attach,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  },
  filetypes = { "sh" },
  root_dir = util.root_pattern(".bashrc", ".git")
}
