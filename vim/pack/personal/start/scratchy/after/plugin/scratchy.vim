
function! FPScratchy(...)
  call call(function("Scratchy"), a:000)
  setlocal cursorline
  nmap <buffer> <CR> 0gf
  nmap <buffer> <ESC><CR> 0<c-w>f<c-w>w
  " keep/drop matching lines
  nnoremap <buffer> ,v :v/<C-R>//d<CR>gg
  nnoremap <buffer> ,d :g/<C-R>//d<CR>gg
  " keep/drop matching lines, from visual selection
  vnoremap <buffer> ,v :v/<C-R>//d<CR>gg
  vnoremap <buffer> ,d :g/<C-R>//d<CR>gg
endfunction
command -nargs=* FPScratchy :call FPScratchy(<args>)

" SCRATCHY MAPPINGS

" replace current buffer
nmap <ESC>h :FPScratchy "rg --files --sort path"<CR>:call search("^" . fnamemodify(@#, ":.") . "$", 'cW')<CR>zz
nmap <ESC>H :FPScratchy "rg --files -uuu --sort path"<CR>:call search("^" . fnamemodify(@#, ":.") . "$", 'cW')<CR>zz

" textmate-like command-t
nmap <ESC>t :new<CR><ESC>h
nmap <ESC>T :vnew<CR><ESC>h

" chunks in split
nmap <ESC>c :vnew<CR>:FPScratchy "rg -u --files --no-ignore-parent --sort path $DOTFILES/chunks"<CR>

