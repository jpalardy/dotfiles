if exists("g:loaded_syntastic_notifier_cursor")
    finish
endif
let g:loaded_syntastic_notifier_cursor = 1

if !exists('g:syntastic_echo_current_error')
    let g:syntastic_echo_current_error = 1
endif

let g:SyntasticCursorNotifier = {}

" Public methods {{{1

function! g:SyntasticCursorNotifier.New()
    let newObj = copy(self)
    let b:oldLine = -1
    return newObj
endfunction

function! g:SyntasticCursorNotifier.refresh(loclist)
    autocmd! syntastic CursorMoved
    let enabled = exists('b:syntastic_echo_current_error') ? b:syntastic_echo_current_error : g:syntastic_echo_current_error
    if enabled && a:loclist.hasErrorsOrWarningsToDisplay()
        let b:syntastic_messages = copy(a:loclist.messages())
        autocmd syntastic CursorMoved * call g:SyntasticRefreshCursor()
    endif
endfunction

function! g:SyntasticCursorNotifier.reset(loclist)
    unlet! b:syntastic_messages
    let b:oldLine = -1
endfunction

" Private methods {{{1

" The following defensive nonsense is needed because of the nature of autocmd
function! g:SyntasticRefreshCursor()
    if !exists('b:syntastic_messages')
        " file not checked
        return
    endif

    if !exists('b:oldLine')
        let b:oldLine = -1
    endif
    let l = line('.')
    if l == b:oldLine
        return
    endif
    let b:oldLine = l

    if has_key(b:syntastic_messages, l)
        return syntastic#util#wideMsg(b:syntastic_messages[l])
    else
        echo
    endif
endfunction

" vim: set sw=4 sts=4 et fdm=marker:
