augroup filetypedetect
  autocmd BufNewFile,BufRead *.txt     setf txt
  autocmd BufNewFile,BufRead *.clj     setf clojure
  autocmd BufNewFile,BufRead *.clj     setl lisp
  autocmd BufNewFile,BufRead *.spec    setf ruby
  autocmd BufNewFile,BufRead Capfile   setf ruby
  autocmd BufNewFile,BufRead Gemfile   setf ruby
  autocmd BufNewFile,BufRead *.scala   setf scala
  autocmd BufNewFile,BufRead *.csv     setf csv
  autocmd BufNewFile,BufRead *.json    setf javascript
  autocmd BufNewFile,BufRead *.json    let b:fileFilterCmd = "json_reformat.sh"
  autocmd BufNewFile,BufRead *.json    let b:quickCheckCmd = "json_verify.sh"
  autocmd BufNewFile,BufRead *.less    setf less
  autocmd BufNewFile,BufRead *.moe     setf moe
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

