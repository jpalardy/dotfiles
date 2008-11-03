
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function ScratchBuffer()
  execute ":botright new"
  execute ":set ft=text"
  execute ":set buftype=nofile"
endfunction
command -nargs=0 ScratchBuffer :call ScratchBuffer()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Scratch(command)
  let @r = system(a:command)
  ScratchBuffer
  exec "normal \"rp"
endfunction
command -nargs=1 Scratch :call Scratch(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function ScratchDiff(command)
  execute ":set diff"
  let @r = system(a:command)
  execute ":botright vnew"
  execute ":set buftype=nofile"
  exec "normal \"rp"
endfunction
command -nargs=1 ScratchDiff :call ScratchDiff(<args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

