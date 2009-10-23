
let b:fileFilterCmd = "xml_errors.sh"

function! Snippet_tag(text)
  let l:fixed = substitute(a:text, "^<", "", "g")
  let l:tag = input("tag: ", l:fixed)

  let @y = "bba"
  return "<" . l:tag . "></" . l:tag . ">"
endfunction

let g:snippets["<.*"] = function("Snippet_tag")

