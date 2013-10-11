"============================================================================
"File:        objc.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Gregor Uhlenheuer <kongo2002 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_objc_gcc_checker')
    finish
endif
let g:loaded_syntastic_objc_gcc_checker = 1

if !exists('g:syntastic_objc_compiler')
    let g:syntastic_objc_compiler = 'gcc'
endif

function! SyntaxCheckers_objc_gcc_IsAvailable()
    return executable(g:syntastic_objc_compiler)
endfunction

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:syntastic_objc_compiler_options')
    let g:syntastic_objc_compiler_options = '-std=gnu99'
endif

function! SyntaxCheckers_objc_gcc_GetLocList()
    return syntastic#c#GetLocList('objc', 'gcc', {
        \ 'errorformat':
        \     '%-G%f:%s:,' .
        \     '%-G%f:%l: %#error: %#(Each undeclared identifier is reported only%.%#,' .
        \     '%-G%f:%l: %#error: %#for each function it appears%.%#,' .
        \     '%-GIn file included%.%#,'.
        \     '%-G %#from %f:%l\,,' .
        \     '%f:%l:%c: %trror: %m,' .
        \     '%f:%l:%c: %tarning: %m,' .
        \     '%f:%l:%c: %m,' .
        \     '%f:%l: %trror: %m,' .
        \     '%f:%l: %tarning: %m,' .
        \     '%f:%l: %m',
        \ 'main_flags': '-x objective-c -fsyntax-only',
        \ 'header_flags': '-x objective-c-header -lobjc',
        \ 'header_names': '\.h$' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'objc',
    \ 'name': 'gcc'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
