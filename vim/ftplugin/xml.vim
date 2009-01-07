
nmap <buffer> <F3> :%!tidy -q -xml -indent --indent-spaces 2 -wrap 0<CR>
nmap <buffer> <F4> :%!xmllint --format -<CR>

function! Snippet_tag(text)
  let l:fixed = substitute(a:text, "^<", "", "g")
  let l:tag = input("tag: ", l:fixed)

  let @y = "bba"
  return "<" . l:tag . "></" . l:tag . ">"
endfunction

let g:snippets["<.*"] = function("Snippet_tag")

