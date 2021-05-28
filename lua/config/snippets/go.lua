return
    { func = [[func ${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)}){ $0 }]] }
