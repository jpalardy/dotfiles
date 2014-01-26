
function! Snippet_tag(text)
  let tag = substitute(a:text, "^<", "", "g")
  return "<" . tag . ">|</" . tag . ">"
endfunction

if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets["<[^%]$"] = function("Snippet_tag")

