local _terraform = {}

function optional(s)
  if s == '' then
    return ''
  else
    return '\n\tdefault = "'..s..'"'
  end
end

local _var = [[
variable "${1}" { ${2|optional(S.v)}
  description = "${3}"
  type = ${4}
}
$0
]]

local _gcp = [[
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  $0
}
]]

function _terraform.snippets()
  return {
    gcp = _gcp,
    var = _var,
  }
end

return _terraform
