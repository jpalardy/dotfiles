
let b:fileFilterCmd = "xml_errors.sh"

function! Snippet_tag(text)
  let l:tag = substitute(a:text, "^<", "", "g")
  return "<" . l:tag . ">|</" . l:tag . ">"
endfunction

let g:snippets["<[^%]"] = function("Snippet_tag")

