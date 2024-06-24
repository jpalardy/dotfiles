
setlocal equalprg=eq-elm

let b:ale_linters_ignore = ['make']
let b:ale_fixers = ['elm-format']

let g:ale_elm_ls_use_global = 0

