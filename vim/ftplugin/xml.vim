
nmap <buffer> <F1> V<F1>
vmap <buffer> <F1> <ESC>:call XML_toggle_comments()<CR>

imap <buffer> <F2> <ESC><F2>
nmap <buffer> <F2> V<F2>
vmap <buffer> <F2> <ESC>:call XML_tag()<CR>

nmap <buffer> <F3> :%!tidy -q -xml -indent --indent-spaces 2 -wrap 0<CR>
nmap <buffer> <F4> :%!xmllint --format -<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! XML_tag()
  let l:tag = input("tag: ")
  call Surround("<" . l:tag . ">", "</" . l:tag . ">")
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! XML_toggle_comments()
  let l:first_line = getline(line("'<"))
  if l:first_line =~ " *<!--"
    call XML_uncomment()
  else
    call XML_comment()
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! XML_comment()
  call Surround("<!-- ", " -->")
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! XML_uncomment()
  exec "normal '<"
  exec ":s/<!-- //"
  exec "normal '>"
  exec ":s/ -->//"
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Snippet_tag(text)
  let l:fixed = substitute(a:text, "^<", "", "g")
  let l:tag = input("tag: ", l:fixed)

  let @y = "bba"
  return "<" . l:tag . "></" . l:tag . ">"
endfunction

let g:snippets["<.*"] = function("Snippet_tag")

