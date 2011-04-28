
" SCRATCHY MAPPINGS

" filtering
nnoremap <ESC>f :SplitScratchy b:fileFilterCmd . " " . expand("%")<CR>

function! StarToggle()
  let line = getline(".")
  if match(line, " \\*$")  != -1
    let line = line[0:-3]
  else
    let line = line . " *"
  endif
  call setline(".", line)
endfunction

function! FPScratchy(...)
  call call(function("Scratchy"), a:000)
  setlocal cursorline
  let @/ = "*$"

  nmap <buffer> <CR> 0gf
  nmap <buffer> <ESC><CR> 0<c-w>f<c-w>w
  map  <buffer> <SPACE> :call StarToggle()<CR>
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

