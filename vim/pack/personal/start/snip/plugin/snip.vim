
function! s:snipReplace()
  " extract text in front of cursor, put in register x
  execute "normal! v0\"xy"

  " convert w/ snip command-line
  silent let @x = system("snip -v filetype=" . shellescape(&ft) . " -v path=" . shellescape(expand("%")), @x)
  " strip trailing CR
  let @x = trim(@x, "\n", 2)

  " overwrite-paste
  execute "normal! gv\"xp"

  " if snippet contains a block char (▒), position cursor
  if match(@x, "▒") != -1
    call search("▒", "b")
    let @x = "xi"
    return
  endif

  " back to insert mode
  let @x = "a"
endfunction

"-- mappings
inoremap <TAB> <ESC>:call <SID>snipReplace()<CR>@x

