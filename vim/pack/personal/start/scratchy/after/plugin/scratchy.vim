
function! Lines2arglocal() range
  let lines = map(range(a:firstline, a:lastline), 'getline(v:val)')
  execute "arglocal " . join(lines, " ")
endfunction
command -range Lines2arglocal <line1>,<line2>:call Lines2arglocal()

function! FPScratchy(...)
  call call(function("Scratchy"), a:000)
  setlocal cursorline
  nmap <buffer> <CR> 0gf
  vmap <buffer> <CR> :Lines2arglocal<CR>
  nmap <buffer> <ESC><CR> 0<c-w>f<c-w>w
endfunction
command -nargs=* FPScratchy :call FPScratchy(<args>)

" SCRATCHY MAPPINGS

" replace current buffer
nmap <ESC>h :FPScratchy "rg --files --no-ignore-parent --sort-files"<CR>

" replace current buffer with git status
nmap <ESC>g :FPScratchy "git status --short \| cut -c4- \| sort"<CR>

" textmate-like command-t
nmap <ESC>t :botright  new<CR><ESC>h
nmap <ESC>T :botright vnew<CR><ESC>h

" chunks in split
nmap <ESC>c :botright vnew<CR>:FPScratchy "rg --files --no-ignore-parent --sort-files $DOTFILES/chunks"<CR>

