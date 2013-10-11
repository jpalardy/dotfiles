"============================================================================
"File:        verilator.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Kocha <kocha dot lsifrontend at gmail dot com>
"============================================================================

if exists("g:loaded_syntastic_verilog_verilator_checker")
    finish
endif
let g:loaded_syntastic_verilog_verilator_checker = 1

if !exists('g:syntastic_verilog_compiler')
    let g:syntastic_verilog_compiler = 'verilator'
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_verilog_verilator_IsAvailable()
    return executable(g:syntastic_verilog_compiler)
endfunction

if !exists('g:syntastic_verilog_compiler_options')
    let g:syntastic_verilog_compiler_options = '-Wall'
endif

function! SyntaxCheckers_verilog_verilator_GetLocList()
    return syntastic#c#GetLocList('verilog', 'verilator', {
        \ 'errorformat':
        \     '%%%trror-%\=%\w%#: %f:%l: %m,' .
        \     '%%%tarning-%\=%\w%#: %f:%l: %m',
        \ 'main_flags': '--lint-only' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'verilog',
    \ 'name': 'verilator'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
