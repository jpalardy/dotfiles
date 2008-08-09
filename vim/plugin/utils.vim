
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Strip(text)
  return substitute(a:text, "^ *\\| *$", "", "g")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Squeeze(text)
  return substitute(a:text, " \\+", " ", "g")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Surround(prefix, suffix)
  set paste
  exec "normal `>a" . a:suffix
  exec "normal '<i" . a:prefix
  set nopaste
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

