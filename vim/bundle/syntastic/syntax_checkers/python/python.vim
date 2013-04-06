"============================================================================
"File:        python.vim
"Description: Syntax checking plugin for syntastic.vim
"Author:      Artem Nezvigin <artem at artnez dot com>
"
" `errorformat` derived from:
" http://www.vim.org/scripts/download_script.php?src_id=1392
"
"============================================================================
if exists("g:loaded_syntastic_python_python_checker")
    finish
endif
let g:loaded_syntastic_python_python_checker=1

function! SyntaxCheckers_python_python_IsAvailable()
    return executable('python')
endfunction

function! SyntaxCheckers_python_python_GetLocList()
    let l:path = shellescape(expand('%'))
    let l:cmd = "compile(open(" . l:path . ").read(), " . l:path . ", 'exec')"
    let l:makeprg = 'python -c "' . l:cmd . '"'

    let l:errorformat =
        \ "\%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m," .
        \ "\%C\ \ \ \ %.%#," .
        \ "\%+Z%.%#Error\:\ %.%#," .
        \ "\%A\ \ File\ \"%f\"\\\,\ line\ %l," .
        \ "\%+C\ \ %.%#," .
        \ "\%-C%p^," .
        \ "\%Z%m," .
        \ "\%-G%.%#"

    return SyntasticMake({ 'makeprg': l:makeprg, 'errorformat': l:errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'python',
    \ 'name': 'python'})
