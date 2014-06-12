
function! s:Grep(text)
  silent execute "grep! -R " . shellescape(a:text) . " ."
  redraw!
  copen
endfunction
command -nargs=* Grep :call <SID>Grep(<args>)

function! s:Grepv(type)
  if a:type !=# 'v'
    return
  endif
  let saved_unnamed_register = @@
  normal! `<v`>y
  call <SID>Grep(@@)
  let @@ = saved_unnamed_register
endfunction

nnoremap ,g :Grep '
vnoremap ,g :<c-u>call <SID>Grepv(visualmode())<cr>

