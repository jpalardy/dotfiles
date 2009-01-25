
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Scratch(...)
  " makes first argument optional, defaults to "new"
  let l:command = (a:0 >= 1 ? a:1 : "")
  let l:splitMode = (a:0 >= 2 ? a:2 : "new")

  execute ":botright " . l:splitMode
  execute ":set ft=text"
  execute ":set buftype=nofile"

  if l:command != ''
    let @r = system(l:command)
    exec "normal \"rp"
  endif
endfunction
command -nargs=* Scratch :call Scratch(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ScratchDiff(command, ...)
  let l:splitMode = (a:0 == 1  ? a:1 : "vnew")

  execute ":set diff"
  Scratch a:command, l:splitMode
endfunction
command -nargs=+ ScratchDiff :call ScratchDiff(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ScratchFind(...)
  let l:command = (a:0 >= 1 ? a:1 : g:scratch_find_command)
  let l:splitMode = (a:0 >= 2  ? a:2 : "new")

  Scratch l:command, l:splitMode
  nmap <buffer> <CR> gf
  nmap <buffer> <ESC><CR> <c-w>f<c-w>w
endfunction
command -nargs=* ScratchFind :call ScratchFind(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:scratch_find_command = "find . -name .git -prune -o -name .hg -prune -o -name *.swp -prune -o -type f -print \| sort"

" textmate-like command-t
nnoremap <ESC>t :ScratchFind<CR>

nnoremap <ESC>s :Scratch

