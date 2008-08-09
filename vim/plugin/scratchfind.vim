
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function ScratchFind()
  Scratch("find . -type f \| sort")
  nmap <buffer> <CR> gf
endfunction
command -nargs=0 ScratchFind :call ScratchFind()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" textmate-like command-t
nmap <ESC>t :ScratchFind<CR>

