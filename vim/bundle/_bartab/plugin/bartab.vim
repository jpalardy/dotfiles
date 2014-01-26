
function! BarTab() range
  let line = getline((a:firstline + a:lastline)/2)
  if match(line, ':') != -1
    let @y = "gv:Tabularize /:\\zs/l0l1"
    return
  endif
  if match(line, '=') != -1
    let @y = "gv:Tabularize /="
    return
  endif
  let @y = "gv:Tabularize /"
endfunction

vnoremap <BAR> :call BarTab()<CR>@y

