
augroup filetypedetect
  autocmd BufNewFile,BufRead *.txt       setf txt
  autocmd BufNewFile,BufRead *.deck      setf deck
  autocmd BufNewFile,BufRead *.moe       setf moe
augroup END

" CURSOR ASSUMES PREVIOUS POSITION
autocmd BufReadPost * if line("'\"") > 0             |
\                       if line("'\"") <= line("$")  |
\                         exe("norm '\"")            |
\                       else                         |
\                         exe "norm $"               |
\                       endif                        |
\                     endif

