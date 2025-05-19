
function! FPScratchy(...)
  call call(function("Scratchy"), a:000)
  setlocal cursorline
  nmap <buffer> <CR> 0gf
  nmap <buffer> <ESC><CR> 0<c-w>f<c-w>w
endfunction
command -nargs=* FPScratchy :call FPScratchy(<args>)

" SCRATCHY MAPPINGS

" replace current buffer
nmap <ESC>h :FPScratchy "rg --files --sort path"<CR>:call search("^" . fnamemodify(@#, ":.") . "$", 'cW')<CR>zz
nmap <ESC>H :FPScratchy "rg --files -uuu --sort path"<CR>:call search("^" . fnamemodify(@#, ":.") . "$", 'cW')<CR>zz
command FPScratchyH :normal <ESC>h

" textmate-like command-t
nmap <ESC>t :new<CR><ESC>h
nmap <ESC>T :vnew<CR><ESC>h

