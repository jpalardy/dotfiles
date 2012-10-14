"============================================================================
"File:        typescript.vim
"Description: TypeScript syntax checker. For TypeScript v0.8.0
"Maintainer:  Bill Casarin <bill@casarin.ca>
"============================================================================
if exists("loaded_typescript_syntax_checker")
    finish
endif
let loaded_typescript_syntax_checker = 1

"bail if the user doesnt have tsc installed
if !executable("tsc")
    finish
endif

function! SyntaxCheckers_typescript_GetLocList()
    let makeprg = 'tsc ' . shellescape(expand("%")) . ' --out /dev/null'
    let errorformat = '%f (%l\,%c): %m'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
