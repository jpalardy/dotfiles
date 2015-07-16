
function! MaxLine()
  let maxcol = 0
  let lnum = 1
  while lnum <= line("$")
    call cursor(lnum, 0)
    if col("$") > maxcol
      let maxcol = col("$")
      let maxline = lnum
    endif
    let lnum += 1
  endwhile
  execute "normal! " . maxline . "G$"
endfunction

nnoremap ,ml :call MaxLine()<CR>

