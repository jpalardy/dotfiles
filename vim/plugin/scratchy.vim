
"         Scratchy(command="")
function! Scratchy(command)
  "let l:command = (a:0 > 0 ? a:1 : '')

  execute ':enew'
  setlocal filetype=scratchy
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  execute "%!" . a:command
endfunction
command -nargs=* Scratchy :call Scratchy(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SplitScratchy(command)
  execute "botright new"
  call Scratchy(a:command)
endfunction
command -nargs=* SplitScratchy :call SplitScratchy(<args>)

