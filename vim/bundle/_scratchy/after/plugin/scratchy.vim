
function! Lines2arglocal() range
  let lines = map(range(a:firstline, a:lastline), 'getline(v:val)')
  execute "arglocal " . join(lines, " ")
endfunction
command -range Lines2arglocal <line1>,<line2>:call Lines2arglocal()

function! FPScratchy(...)
  let cached=0
  if filereadable(".cache_af")
    let cached=1
  endif
  call call(function("Scratchy"), a:000)
  setlocal cursorline
  nmap <buffer> <CR> 0gf
  vmap <buffer> <CR> :Lines2arglocal<CR>
  nmap <buffer> <ESC><CR> 0<c-w>f<c-w>w
  if cached
    redraw | echohl ErrorMsg | echo "cached" | echohl None
  endif
endfunction
command -nargs=* FPScratchy :call FPScratchy(<args>)

" SCRATCHY MAPPINGS

" replace current buffer
nmap <ESC>h :FPScratchy "ack_find"<CR>
" replace current buffer (force cache refresh)
nmap <ESC>H :FPScratchy "ack_find -f -w"<CR>

" textmate-like command-t
nmap <ESC>t :botright  new<CR><ESC>h
nmap <ESC>T :botright vnew<CR><ESC>h

