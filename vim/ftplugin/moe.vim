
function! ToggleBox()
  let cline = getline(".")
  if match(cline, "^ \*\\[ \\]") != -1
    normal! ^lrx
  elseif match(cline, "^ \*\\[.\\]") != -1
    execute "normal! ^lr "
  end
  " not a box line -- don't toggle
  normal! j
  " position cursor in the box, if there is one
  if match(cline, "^ \*\\[.\\]") != -1
    normal! ^l
  end
endfunction

nnoremap <buffer> <CR> :call ToggleBox()<CR>

