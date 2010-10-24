
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets = {}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SnippetMatch(text)
  if exists("b:snippets")
    let snippets = extend(copy(g:snippets), b:snippets)
  else
    let snippets = g:snippets
  endif

  let result = ""
  for key in sort(keys(snippets))
    if match(a:text, key) != 0
      continue
    endif

    if type(snippets[key]) == 2 " Funcref
      call inputsave()
      let result = snippets[key](a:text)
      call inputrestore()
    else
      let result = snippets[key]
    endif
    break
  endfor

  return result
endfunction

function! SubstringsFromRight(text)
  let result = []

  let i = 1
  while i <= len(a:text)
     call add(result, strpart(a:text, len(a:text)-i, i))
     let i = i + 1
  endwhile

  return result
endfunction

function! Snippet()
  let @y = "a"

  let line_to_cursor = strpart(getline('.'), 0, col('.'))
  let eol = col('.') == strlen(getline('.'))
  let substrings = SubstringsFromRight(line_to_cursor)

  for string in substrings
    let result = SnippetMatch(string)

    if strlen(result)
      let @" = result

      " replace text with snippet
      if len(string)-1
        execute "normal v" . (len(string) - 1) . "hgp"
      else
        execute "normal vgp"
      endif

      " position cursor wrt eol
      if eol
        let @y = "a"
      else
        let @y = "i"
      endif

      " if snippet contains a pipe (|), position cursor
      if match(result, "|") != -1
        call search("|", "b")
        let @y = "xi"
      endif

      return
    endif
  endfor
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <TAB> <ESC>:call Snippet()<CR>@y
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

