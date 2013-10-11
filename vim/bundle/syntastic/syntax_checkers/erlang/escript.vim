"============================================================================
"File:        erlang.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Pawel Salata <rockplayer.pl at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_erlang_erlang_checker')
    finish
endif
let g:loaded_syntastic_erlang_erlang_checker = 1

if !exists('g:syntastic_erlc_include_path')
    let g:syntastic_erlc_include_path = ''
endif

let s:check_file = expand('<sfile>:p:h') . '/erlang_check_file.erl'

function! SyntaxCheckers_erlang_escript_IsAvailable()
    return executable('escript')
endfunction

function! SyntaxCheckers_erlang_escript_GetLocList()
    if expand('%:e') ==# 'hrl'
        return []
    endif

    let shebang = syntastic#util#parseShebang()
    if shebang['exe'] ==# 'escript'
        let args = '-s'
        let post_args = ''
    else
        let args = s:check_file
        let post_args = g:syntastic_erlc_include_path
    endif
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'escript',
        \ 'args': args,
        \ 'fname': syntastic#util#shexpand('%:p'),
        \ 'post_args': post_args,
        \ 'filetype': 'erlang',
        \ 'subchecker': 'escript' })

    let errorformat =
        \ '%W%f:%l: warning: %m,'.
        \ '%E%f:%l: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'erlang',
    \ 'name': 'escript'})
