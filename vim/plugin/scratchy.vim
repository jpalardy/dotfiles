
"         Scratchy(command, input=None)
function! Scratchy(...)
  execute ':enew'
  setlocal filetype=scratchy
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  if !empty(a:000)
    let l:result = call(function("system"), a:000)
    put =l:result
    normal ggdd
  endif
endfunction
command -nargs=* Scratchy :call Scratchy(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SplitScratchy(...)
  execute "botright new"
  call call(function("Scratchy"), a:000)
endfunction
command -nargs=* SplitScratchy :call SplitScratchy(<args>)

