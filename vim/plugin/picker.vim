
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function PickerMode()
  set cursorline
  nmap <buffer> <CR>    V:w! ~/.picked<CR>:qa!<CR>
endfunction
command -nargs=0 PickerMode :call PickerMode()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

