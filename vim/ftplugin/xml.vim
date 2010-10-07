
let b:fileFilterCmd = "xml_errors.sh"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Snippet_tag(text)
  let l:tag = substitute(a:text, "^<", "", "g")
  return "<" . l:tag . ">|</" . l:tag . ">"
endfunction

if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets["<[^%]"] = function("Snippet_tag")

