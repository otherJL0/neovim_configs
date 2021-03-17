local _rust = {}

function _rust.settings()
    return {
        assist = {
            importMergeBehavior = "full", -- (default: "full")
            importPrefix = "plain", -- (default: "plain")
            importGroup = true -- (default: true) ]]
        },

        callInfo = {
            full = true -- (default: true)
        },

        cargo = {
            autoreload = true, -- (default: true)
            allFeatures = false, -- (default: false)
            features = {}, -- (default: [])
            runBuildScripts = true, -- (default: true)
            noDefaultFeatures = false, -- (default: false)
            target = nil, -- (default: null)
            noSysroot = false -- (default: false)
        },

        check_on_save = {
            enable = true, -- (default: true)
            allFeatures = nil, -- (default: null)
            allTargets = true, -- (default: true)
            command = "check", -- (default: "check")
            noDefaultFeatures = nil, -- (default: null)
            target = nil, -- (default: null)
            extraArgs = {}, -- (default: [])
            features = nil, -- (default: null)
            overrideCommand = nil -- (default: null)
        },

        completion = {
            addCallArgumentSnippets = true, -- (default: true)
            addCallParenthesis = true, -- (default: true)
            enable = true -- (default: true)
        },

        diagnistics = {
            enable = true, -- (default: true)
            enableExperimental = true, -- (default: true)
            disabled = {}, -- (default: [])
            warningsAsHint = {}, -- (default: [])
            warningsAsInfo = {} -- (default: [])
        },

        files = {
            watcher = "client", -- (default: "client")
            excludeDirs = {} -- (default: [])
        },

        hoverActions = {
            debug = true, -- (default: true)
            enable = true, -- (default: true)
            gotoTypeDef = true, -- (default: true)
            implementations = true, -- (default: true)
            run = true, -- (default: true)
            linksInHover = true -- (default: true)
        },

        inlayHints = {
            chainingHints = true, -- (default: true)
            maxLength = nil, -- (default: null)
            parameterHints = true, -- (default: true)
            typeHints = true -- (default: true)
        },

        lens = {
            debug = true, -- (default: true)
            enable = true, -- (default: true)
            implementations = true, -- (default: true)
            run = true, -- (default: true)
            methodReferences = false, -- (default: false)
            references = false -- (default: false)
        },

        lruCapacity = nil, -- (default: null)

        notifications = {
            cargoTomlNotFound = true -- = true,--(default: true)
        },

        procMacro = {
            enable = false, -- (default: false)
            server = nil -- (default: null)
        },

        runnables = {
            overrideCargo = nil, -- (default: null)
            cargoExtraArgs = {} -- (default: [])
        },

        rustfmt = {
            extraArgs = {}, -- (default: [])
            overrideCommand = nil -- (default: null)
        }
    }
end

return _rust
