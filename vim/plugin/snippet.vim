
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets = {}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet(text)
  let @x = a:text
  let @y = "a"

  if exists("b:snippets")
    let snippets = extend(copy(g:snippets), b:snippets)
  else
    let snippets = g:snippets
  endif

  for key in sort(keys(snippets))
    if match(a:text, key) != 0
      continue
    endif

    if type(snippets[key]) == 2 " Funcref
      call inputsave()
      let @x = snippets[key](a:text)
      call inputrestore()
    else
      let @x = snippets[key]
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

