
" revisit elm_ls, was broken
let b:ale_linters_ignore = ['make']
let b:ale_fixers = ['elm-format']

let g:ale_elm_ls_elm_format_path = 'node_modules/.bin/elm-format'
let g:ale_elm_ls_elm_path = 'node_modules/.bin/elm'
let g:ale_elm_ls_elm_test_path = 'node_modules/.bin/elm-test'
let g:ale_elm_ls_use_global = 0

