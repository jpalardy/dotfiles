
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets = {}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet(text)
  let @x = a:text
  let @y = "a"

  if exists("b:snippets")
    let l:snippets = extend(copy(g:snippets), b:snippets)
  else
    let l:snippets = g:snippets
  endif

  for l:key in sort(keys(l:snippets))
    if match(a:text, l:key) != 0
      continue
    endif

    if type(l:snippets[l:key]) == 2 " Funcref
      call inputsave()
      let @x = l:snippets[l:key](a:text)
      call inputrestore()
    else
      let @x = l:snippets[l:key]
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

