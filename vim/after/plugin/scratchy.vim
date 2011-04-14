
" SCRATCHY MAPPINGS

" filtering
nnoremap <ESC>f :SplitScratchy b:fileFilterCmd . " " . expand("%")<CR>

function! FPScratchy(...)
  call call(function("Scratchy"), a:000)
  nmap <buffer> <CR> gf
  nmap <buffer> <ESC><CR> <c-w>f<c-w>w
endfunction
command -nargs=* FPScratchy :call FPScratchy(<args>)

" replace current buffer
nmap <ESC>h :FPScratchy "ack_find"<CR>
" replace current buffer (force cache refresh)
nmap <ESC>H :FPScratchy "ack_find -f"<CR>

" textmate-like command-t
nmap <ESC>t :botright  new<CR><ESC>h
nmap <ESC>T :botright vnew<CR><ESC>h

" ack
nmap <ESC>a :FPScratchy "ack -ail "<LEFT>

