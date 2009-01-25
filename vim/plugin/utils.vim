
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Strip(text)
  return substitute(a:text, "^ *\\| *$", "", "g")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Squeeze(text)
  return substitute(a:text, " \\+", " ", "g")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Center(text, width, fill)
  let l:l = repeat(a:fill, (a:width-len(a:text))/2)
  let l:r = repeat(a:fill,  a:width-len(a:text)-len(l:l)) " same as above, opposite rounding

  return l:l . a:text . l:r
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

