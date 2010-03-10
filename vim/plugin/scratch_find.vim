
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ScratchFind(command, splitMode)
  Scratch a:command, a:splitMode
  nmap <buffer> <CR> gf
  nmap <buffer> <ESC><CR> <c-w>f<c-w>w
endfunction
command -nargs=* ScratchFind :call ScratchFind(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" textmate-like command-t
nnoremap <ESC>t :ScratchFind "ack_find", "new"<CR>
nnoremap <ESC>T :ScratchFind "ack_find", "vnew"<CR>

