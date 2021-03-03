local _markdown = {}

local _fig =[[
```{figure} ${1}
---
scale: 100%
alt: ${1}
name: ${2}
align: center
---
${0}
```
]]

local _img=[[
```{img} ${1}
:alt: ${1}
:scale: 100%
:align: center
```
]]

local _note=[[
```{note}
${0}
```
]]

local _warn=[[
```{warning}
${0}
```
]]

local _panel=[[
```{panel} ${1}
${0}
```
]]

local _dropdown=[[
```{dropdown} ${1}
${0}
```
]]

local _ext=[[
```{${1}} ${2}
${0}
```
]]

function _markdown.snippets()
  return {
    fig = _fig,
    img = _img,
    ext = _ext,
  }
end


return _markdown
