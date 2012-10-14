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
if exists("loaded_erlang_syntax_checker")
    finish
endif
let loaded_erlang_syntax_checker = 1

"bail if the user doesnt have escript installed
if !executable("erl")
    finish
endif

"g:syntastic_erlc_attrs currently need to set in .vimrc
"TODO: make g:syntastic_erlc_attrs project specific
if !exists("g:syntastic_erlc_attrs")
    let g:syntastic_erlc_attrs=""
endif
let s:check_file = expand('<sfile>:p:h') . '/erlang_check_file "'.g:syntastic_erlc_attrs.'"'

function! SyntaxCheckers_erlang_GetLocList()
    let extension = expand('%:e')
    if match(extension, 'hrl') >= 0
        return []
    endif
    let shebang = getbufline(bufnr('%'), 1)[0]
    if len(shebang) > 0
        if match(shebang, 'escript') >= 0
            let makeprg = 'escript -s '.shellescape(expand('%:p'))
        else
            let makeprg = s:check_file . ' '. shellescape(expand('%:p'))
        endif
    else
        let makeprg =  s:check_file . ' ' . shellescape(expand('%:p'))
    endif
    let errorformat = '%f:%l:\ %tarning:\ %m,%E%f:%l:\ %m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
