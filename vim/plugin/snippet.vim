
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets = {}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet(text)
  let @x = a:text
  let @y = "a"

  for l:key in sort(keys(g:snippets))
    if match(a:text, l:key) != -1
      if type(g:snippets[l:key]) == type("")
        let @x = g:snippets[l:key]
      else
        call inputsave()
        let @x = g:snippets[l:key](a:text)
      call inputrestore()
      endif
      break
    endif
  endfor

  exec "normal \"xp"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <TAB> <ESC>"xdiW:call Snippet(@x)<CR>@y
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

