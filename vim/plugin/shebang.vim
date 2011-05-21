
function! CallInterpreter()
  if match(getline(1), '^\#!') == 0
    exec ("!" . getline(1)[2:] . " %")
  endif
endfunction

nmap <leader>r :call CallInterpreter()<CR>

