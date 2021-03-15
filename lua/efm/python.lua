local _python = {}

function _python.black()
    return {fomatCommand = "black --quiet -", formatStdin = true}
end

function _python.isort()
    return {fomatCommand = "isort --stdout --profile black -", formatStdin = true}
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
