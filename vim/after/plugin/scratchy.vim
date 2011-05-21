
" SCRATCHY MAPPINGS

function! FPScratchy(...)
  call call(function("Scratchy"), a:000)
  setlocal cursorline

  nmap <buffer> <CR> 0gf
  nmap <buffer> <ESC><CR> 0<c-w>f<c-w>w
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

function! Lines2arglocal() range
  let lines = map(range(a:firstline, a:lastline), 'getline(v:val)')

  execute "arglocal " . join(lines, " ")
endfunction
command -range Lines2arglocal <line1>,<line2>:call Lines2arglocal()

