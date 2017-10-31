
function! s:ToggleBox()
  let l:cline = getline(".")
  if match(l:cline, "^ \*\\[ \\]") != -1
    normal! ^lrx
  elseif match(l:cline, "^ \*\\[.\\]") != -1
    execute "normal! ^lr "
  end
  " not a box line -- don't toggle
  normal! j
  " position cursor in the box, if there is one
  if match(l:cline, "^ \*\\[.\\]") != -1
    normal! ^l
  end
endfunction

nnoremap <buffer> <CR> :call <SID>ToggleBox()<CR>

