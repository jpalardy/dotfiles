
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets = {}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet(text)
  let @x = a:text
  let @y = "a"

  for l:key in sort(keys(g:snippets))
    if match(a:text, l:key) != 0
      continue
    endif

    if type(g:snippets[l:key]) == 2 " Funcref
      call inputsave()
      let @x = g:snippets[l:key](a:text)
      call inputrestore()
    else
      let @x = g:snippets[l:key]
    endif
    break
  endfor

  if match(@x, "|") != -1
    let @y = "F|xi"
  endif

  if col('.') < strlen(getline('.'))
    normal "xP
  else
    normal "xp
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <TAB> <ESC>vB"xd:call Snippet(@x)<CR>@y
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

