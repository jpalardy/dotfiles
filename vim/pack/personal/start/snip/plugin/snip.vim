
function! SnipReplace()
  " extract last word, put in register y
  execute "normal! \"xyiw"

  let before = @x

  " convert w/ snip command-line
  silent let @x = system("FT=" . shellescape(&ft) . " snip", @x)
  let @x = substitute(@x, "\\n$", "", "") " strip trailing CR
  echom before "=>" @x

  " overwrite-paste
  execute "normal! viw\"xp"

  " if snippet contains a pipe (|), position cursor
  if match(@x, "|") != -1
    call search("|", "b")
    let @x = "xi"
    return
  endif

  " back to insert mode
  let @x = "a"
endfunction

"-- mappings
inoremap <TAB> <ESC>:call SnipReplace()<CR>@x

