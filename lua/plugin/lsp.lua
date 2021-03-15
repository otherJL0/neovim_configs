local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'

local _sumneko_lua = require 'configs.lsp.sumneko'
local _groovyls = require 'configs.lsp.groovy'
-- local _pyright = require'configs.lsp.pyright'
local _global_attach = require 'configs.lsp.global_attach'
local _python = require('ft/python')

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.cmd [[noautocmd :update]]
        end
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
    vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            underline = true,
            update_in_insert = false
        }
    )(...)
    pcall(vim.lsp.diagnostic.set_loclist, {open_loclist = false})
end

FormatToggle = function(value)
    vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
end
vim.cmd [[command! FormatDisable lua FormatToggle(true)]]
vim.cmd [[command! FormatEnable lua FormatToggle(false)]]

_G.formatting = function()
    if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
        vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
    end
end


lspconfig.groovyls.setup {on_attach = _global_attach.on_attach, cmd = _groovyls.cmd()}

lspconfig.pyright.setup {on_attach = _global_attach.on_attach, root_dir = _python.lsp_root_dir(), settings = _python.lsp_settings()}

require('nlua.lsp.nvim').setup(require('lspconfig'),
                               {on_attach = _global_attach.on_attach, cmd = _sumneko_lua.cmd(), settings = _sumneko_lua.settings()})

lspconfig.gopls.setup {on_attach = _global_attach.on_attach}

lspconfig.kotlin_language_server.setup {
    on_attach = _global_attach.on_attach,
    cmd = {"kotlin-language-server", "--stdio"},
    root_dir = util.root_pattern("settings.gradle.kts", "settings.gradle", ".git")
}

lspconfig.gopls.setup {on_attach = _global_attach.on_attach}

lspconfig.efm.setup {
    on_attach = _global_attach.on_attach,
    init_options = {documentFormatting = true},
    filetypes = {"python"},
    settings = {rootMarkers = {".git/"}, languages = {["="] = {}, python = {_python.black(), _python.isort(), _python.flake8(), _python.mypy()}}}
}

lspconfig.cmake.setup {
    cmd = {"cmake-language-server"},
    filetypes = {"cmake"},
    init_options = {buildDirectory = "build"},
    root_dir = util.root_pattern("compile_commands.json", "build", "makefile", "README.md")
}

lspconfig.clangd.setup {
    on_attach = _global_attach.on_attach,
    cmd = {"clangd-13", "--background-index"},
    filetypes = {"c", "cpp", "cu", "h", "hpp", "c++", "h++"},
    root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", "build", "README.md", "makefile")
}

lspconfig.clojure_lsp.setup {
    on_attach = _global_attach.on_attach,
    filetypes = {"clojure", "edn"},
    root_dir = util.root_pattern("project.clj", "deps.edn", "README.md")
}

lspconfig.codeqlls.setup {on_attach = _global_attach.on_attach, filetypes = {"ql"}, log_level = 2, root_dir = util.root_pattern(".git", "README.md")}

lspconfig.vimls.setup {
    cmd = {"vim-language-server", "--stdio"},
    on_attach = _global_attach.on_attach,
    filetypes = {"vim"},
    init_options = {
        diagnostic = {enable = true},
        indexes = {count = 3, gap = 100, projectRootPatterns = {"runtime", "nvim", ".git", "autoload", "plugin"}, runtimepath = true},
        iskeyword = "@,48-57,_,192-255,-#",
        runtimepath = "",
        suggest = {fromRuntimepath = true, fromVimruntime = true},
        vimruntime = ""
    },
    root_dir = util.root_pattern(".git", "README.md", "init.vim", "init.lua")
}

lspconfig.terraformls.setup {
    cmd = {"terraform-ls", "serve"},
    on_attach = _global_attach.on_attach,
    filetypes = {"terraform", "hcl", "tf"},
    root_dir = util.root_pattern(".terraform", ".git")
}

lspconfig.yamlls.setup {
    cmd = {"yaml-language-server", "--stdio"},
    on_attach = _global_attach.on_attach,
    filetypes = {"yaml", "yml"},
    root_dir = util.root_pattern(".git", vim.fn.getcwd())
}

lspconfig.sqls.setup {
    cmd = {"sqls"},
    on_attach = _global_attach.on_attach,
    -- on_attach = _global_attach.on_attach,
    filetypes = {"sql"},
    root_dir = util.root_pattern(".git", vim.fn.getcwd())
}

lspconfig.jsonls.setup {
    cmd = {"vscode-json-languageserver", "--stdio"},
    on_attach = _global_attach.on_attach,
    filetypes = {"json"},
    init_options = {provideFormatter = true},
    root_dir = util.root_pattern(".git", vim.fn.getcwd())
}

lspconfig.graphql.setup {
    cmd = {"graphql-lsp", "server", "-m", "stream"},
    on_attach = _global_attach.on_attach,
    filetypes = {"graphql"},
    root_dir = util.root_pattern(".git", ".graphqlrc")
}

lspconfig.dockerls.setup {
    cmd = {"docker-langserver", "--stdio"},
    on_attach = _global_attach.on_attach,
    filetypes = {"Dockerfile", "dockerfile"},
    root_dir = util.root_pattern("Dockerfile")
}

lspconfig.bashls.setup {
    cmd = {"bash-language-server", "start"},
    on_attach = _global_attach.on_attach,
    cmd_env = {GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"},
    filetypes = {"sh"},
    root_dir = util.root_pattern(".bashrc", ".git")
}

lspconfig.rust_analyzer.setup {on_attach = _global_attach.on_attach}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                                                                   {virtual_text = true, signs = true, update_in_insert = true})

lspconfig.sqls.setup {
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup {picker = 'telescope'}
    end
}
