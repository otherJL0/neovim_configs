
return {
  black =
  {
    formatCommand = "black --fast -",
    formatStdin = true
  },

  isort = 
  {
    formatCommand = "isort --stdout --profile black -",
    formatStdin = true,
  },

  flake8 = 
  {
    lintCommand = "flake8 --max-line-length 160 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %t%m"},
    lintSource = "flake8"
  },
  
  mypy = 
  {
    lintCommand = "mypy --show-column-numbers --ignore-missing-imports",
    lintFormats = {
        "%f:%l:%c: %trror: %m",
        "%f:%l:%c: %tarning: %m",
        "%f:%l:%c: %tote: %m"
    },
    lintSource = "mypy"
  } 
}
