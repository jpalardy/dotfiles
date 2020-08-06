
setlocal equalprg=pp-r

let b:slime_cell_delimiter = "#--"

function SlimeOverride_EscapeText_r(text)
  return system("grep .", a:text)
endfunction

