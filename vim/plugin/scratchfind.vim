
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function ScratchFind()
  Scratch("ftf \| sort")
  nmap <buffer> <CR> gf
  nmap <buffer> <ESC><CR> <c-w>f<c-w>w
endfunction
command -nargs=0 ScratchFind :call ScratchFind()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" textmate-like command-t
nmap <ESC>t :ScratchFind<CR>

