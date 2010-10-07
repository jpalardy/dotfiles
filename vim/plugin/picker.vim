
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function PickerMode()
  setlocal cursorline
  setlocal number
  nmap <buffer> <CR>    V:w! ~/.picked<CR>:qa!<CR>
endfunction
command -nargs=0 PickerMode :call PickerMode()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

