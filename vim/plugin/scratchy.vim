
"         Scratchy(command, input=None)
function! Scratchy(...)
  try
    enew
  catch
    echohl ErrorMsg | echo "No write since last change" | echohl None
    sleep 1
    return
  endtry

  setlocal filetype=scratchy
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile

  if !empty(a:000)
    let result = call(function("system"), a:000)
    put =result
    normal! ggdd
  endif
endfunction
command -nargs=* Scratchy :call Scratchy(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SplitScratchy(...)
  execute "botright new"
  call call(function("Scratchy"), a:000)
endfunction
command -nargs=* SplitScratchy :call SplitScratchy(<args>)

