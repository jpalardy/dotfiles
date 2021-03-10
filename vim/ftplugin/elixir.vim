
setlocal equalprg=pp-elixir

function CloseComments()
  setlocal foldmethod=syntax
  execute "normal zR"
  execute "g/^ *@\\(module\\)\\?doc/foldclose"
endfunction

nmap ,z :call CloseComments()<cr>

