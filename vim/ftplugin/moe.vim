
function! ToggleBox()
  let cline = getline(".")
  if match(cline, "^ \*\\[ \\]") != -1
    normal ^lrx
  elseif match(cline, "^ \*\\[.\\]") != -1
    execute "normal ^lr "
  else
    " not a box line -- don't toggle -- default behavior
    normal j
  end
endfunction

nnoremap <buffer> <CR> :call ToggleBox()<CR>

