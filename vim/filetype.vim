
augroup fix_formatoptions
  autocmd!
  autocmd BufEnter * set formatoptions-=o formatoptions-=r
augroup END

augroup other_filetypedetect
  autocmd!
  " misc
  autocmd BufNewFile,BufRead *.deck      setf deck
  autocmd BufNewFile,BufRead *.moe       setf moe
  autocmd BufNewFile,BufRead *.mxm       setf maxima
  autocmd BufNewFile,BufRead *.csv       setf csv
  autocmd BufNewFile,BufRead *.har       setf json
  autocmd BufNewFile,BufRead *.livemd    setf markdown
augroup END

augroup cursor_position
  autocmd!
  " CURSOR ASSUMES PREVIOUS POSITION
  autocmd BufReadPost * if line("'\"") > 0             |
  \                       if line("'\"") <= line("$")  |
  \                         exe "norm '\""             |
  \                       else                         |
  \                         exe "norm $"               |
  \                       endif                        |
  \                     endif
augroup END

