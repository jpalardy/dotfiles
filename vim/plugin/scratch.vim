
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Scratch(...)
  " makes first argument optional, defaults to "new"
  let l:command = (a:0 >= 1 ? a:1 : "")
  let l:splitMode = (a:0 >= 2 ? a:2 : "new")

  execute ":botright " . l:splitMode
  execute ":set ft=scratch"
  execute ":set buftype=nofile"

  if l:command != ''
    let @r = system(l:command)
    exec "normal V\"rp"
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

nnoremap <ESC>s :Scratch ""<LEFT>

nnoremap <ESC>a :Scratch "ack --group "<LEFT>

nnoremap <ESC>f :Scratch b:fileFilterCmd . " " . expand("%")<CR>

