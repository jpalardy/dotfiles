"============================================================================
"File:        splint.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  LCD 47 <lcd047 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================
"
" The setting 'g:syntastic_splint_config_file' allows you to define a file
" that contains additional compiler arguments like include directories or
" CFLAGS. The file is expected to contain one option per line. If none is
" given the filename defaults to '.syntastic_splint_config':
"
"   let g:syntastic_splint_config_file = '.config'

if exists("loaded_splint_syntax_checker")
    finish
endif
let loaded_splint_syntax_checker = 1

function! SyntaxCheckers_c_splint_IsAvailable()
    return executable("splint")
endfunction

if !exists('g:syntastic_splint_config_file')
    let g:syntastic_splint_config_file = '.syntastic_splint_config'
endif

function! SyntaxCheckers_c_splint_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'splint',
        \ 'post_args': '-showfunc -hints +quiet ' . syntastic#c#ReadConfig(g:syntastic_splint_config_file),
        \ 'subchecker': 'splint' })

    let errorformat =
        \ '%W%f:%l:%v: %m,' .
        \ '%W%f:%l: %m,' .
        \ '%-C %\+In file included from %.%#,' .
        \ '%-C %\+from %.%#,' .
        \ '%+C %.%#'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': {'type': 'W', 'subtype': 'Style' } })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'c',
    \ 'name': 'splint'})
