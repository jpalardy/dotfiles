
setlocal equalprg=pp-r

function SlimeOverride_EscapeText_r(text)
  return system("grep .", a:text)
endfunction

