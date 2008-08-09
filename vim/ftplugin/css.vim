
nmap <buffer> <F1> V<F1>
vmap <buffer> <F1> <ESC>:call CSS_toggle_comments()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CSS_toggle_comments()
  let l:first_line = getline(line("'<"))
  if l:first_line =~ " */\\*"
    call CSS_uncomment()
  else
    call CSS_comment()
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CSS_comment()
  call Surround("/\* ", " */")
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CSS_uncomment()
  exec "normal '<"
  exec ":s_/\\* __"
  exec "normal '>"
  exec ":s_ \\*/__"
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

