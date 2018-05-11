
function! WindowSwap()
  if !exists("g:markedWinNum")
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
    return
  endif
  let curWinNum = winnr()
  let curBufNum = bufnr("%")
  exe g:markedWinNum . "wincmd w"
  exe 'hide buf' curBufNum
  exe curWinNum . "wincmd w"
  exe 'hide buf' g:markedBufNum
  unlet g:markedWinNum
  unlet g:markedBufNum
endfunction

command WS :call WindowSwap()
