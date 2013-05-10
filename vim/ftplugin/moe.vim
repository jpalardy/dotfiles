
function! ToggleBox()
  let cline = getline(".")
  if match(cline, "^\\[ \\]") != -1
    normal ^lrx
    return
  end
  if match(cline, "^\\[x\\]") != -1
    execute "normal ^lr "
    return
  end
  " not a box line -- don't toggle
endfunction

nnoremap <buffer> <CR> :call ToggleBox()<CR>j

