augroup filetypedetect
  autocmd BufNewFile,BufRead *.txt     setf txt
  autocmd BufNewFile,BufRead *.clj     setf clojure
  autocmd BufNewFile,BufRead *.clj     setl lisp
  autocmd BufNewFile,BufRead *.spec    setf ruby
  autocmd BufNewFile,BufRead *.scala   setf scala
augroup END

augroup aes256
  autocmd!

  autocmd BufReadPre *.aes       set viminfo=
  autocmd BufReadPre *.aes       set noswapfile

  autocmd BufReadPost *.aes      let $vimpass = inputsecret("Password: ")
  autocmd BufReadPost *.aes      silent '[,']!openssl enc -d -aes-256-cbc -a -salt -pass pass:$vimpass

  autocmd BufWritePre *.aes      silent '[,']!openssl enc -e -aes-256-cbc -a -salt -pass pass:$vimpass

  autocmd BufWritePost *.aes     u
augroup END

" CURSOR ASSUMES PREVIOUS POSITION
autocmd BufReadPost * if line("'\"") > 0             |
\                       if line("'\"") <= line("$")  |
\                         exe("norm '\"")            |
\                       else                         |
\                         exe "norm $"               |
\                       endif                        |
\                     endif

