"============================================================================
"File:        sparse.vim
"Description: Syntax checking plugin for syntastic.vim using sparse.pl
"Maintainer:  Daniel Walker <dwalker at fifo99 dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================
"
" The setting 'g:syntastic_sparse_config_file' allows you to define a file
" that contains additional compiler arguments like include directories or
" CFLAGS. The file is expected to contain one option per line. If none is
" given the filename defaults to '.syntastic_sparse_config':
"
"   let g:syntastic_sparse_config_file = '.config'

if exists("loaded_sparse_syntax_checker")
    finish
endif
let loaded_sparse_syntax_checker = 1

function! SyntaxCheckers_c_sparse_IsAvailable()
    return executable("sparse")
endfunction

if !exists('g:syntastic_sparse_config_file')
    let g:syntastic_sparse_config_file = '.syntastic_sparse_config'
endif

function! SyntaxCheckers_c_sparse_GetLocList()
    let makeprg = syntastic#makeprg#build({
                \ 'exe': 'sparse',
                \ 'args': '-ftabstop=' . &ts . ' ' . syntastic#c#ReadConfig(g:syntastic_sparse_config_file),
                \ 'subchecker': 'sparse' })

    let errorformat = '%f:%l:%v: %trror: %m,%f:%l:%v: %tarning: %m,'

    let loclist = SyntasticMake({ 'makeprg': makeprg,
                                \ 'errorformat': errorformat,
                                \ 'defaults': {'bufnr': bufnr("")} })
    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'c',
    \ 'name': 'sparse'})
