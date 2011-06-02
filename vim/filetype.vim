
augroup filetypedetect
  autocmd BufNewFile,BufRead *.txt       setf txt
  autocmd BufNewFile,BufRead *.csv       setf csv
  autocmd BufNewFile,BufRead *.less      setf less
  autocmd BufNewFile,BufRead *.moe       setf moe
  autocmd BufNewFile,BufRead Bakefile    call SetFileTypeSH("bash")
augroup END

" CURSOR ASSUMES PREVIOUS POSITION
autocmd BufReadPost * if line("'\"") > 0             |
\                       if line("'\"") <= line("$")  |
\                         exe("norm '\"")            |
\                       else                         |
\                         exe "norm $"               |
\                       endif                        |
\                     endif

