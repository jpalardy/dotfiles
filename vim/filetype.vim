
augroup other_filetypedetect
  autocmd!
  " misc
  autocmd BufNewFile,BufRead *.txt       setf txt
  autocmd BufNewFile,BufRead *.deck      setf deck
  autocmd BufNewFile,BufRead *.moe       setf moe
  autocmd BufNewFile,BufRead *.mxm       setf maxima
  " rubies
  autocmd BufNewFile,BufRead *.spec      setf ruby
  autocmd BufNewFile,BufRead Capfile     setf ruby
  autocmd BufNewFile,BufRead Gemfile     setf ruby
  autocmd BufNewFile,BufRead Vagrantfile setf ruby
augroup END

augroup cursor_position
  autocmd!
  " CURSOR ASSUMES PREVIOUS POSITION
  autocmd BufReadPost * if line("'\"") > 0             |
  \                       if line("'\"") <= line("$")  |
  \                         exe("norm '\"")            |
  \                       else                         |
  \                         exe "norm $"               |
  \                       endif                        |
  \                     endif
augroup END

