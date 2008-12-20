
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function PickerMode()
  set cursorline
  nmap <buffer> <CR>    V:w! ~/.picked<CR>:qa!<CR>
  nmap <buffer> <SPACE> :silent !if [ -e ~/.picked ]; then rm ~/.picked; fi<CR>:qa!<CR>
endfunction
command -nargs=0 PickerMode :call PickerMode()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

